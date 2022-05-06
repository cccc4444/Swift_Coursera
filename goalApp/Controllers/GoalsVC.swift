//
//  ViewController.swift
//  goalApp
//
//  Created by Danylo Kushlianskyi on 03.05.2022.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate



class GoalsVC: UIViewController {
    
    var deletedItem = Goal()

    @IBOutlet weak var undoView: UIView!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        undoView.isHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetCoreDataObjects()
        tableView.reloadData()

    }
    
    func fetCoreDataObjects(){
        self.fetch(completion: {(complete) in
            if complete{
                if goals.count >= 1{
                    tableView.isHidden = false
                }
                else{
                    tableView.isHidden = true
                }
            }
            
        })
    }
    
    @IBAction func addGoalButtonPressed(_ sender: Any) {
        guard let createGoalsVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {
            return
        }
//      presentDetail(createGoalsVC)
        createGoalsVC.modalPresentationStyle = .custom
        createGoalsVC.transitioningDelegate = self
        self.present(createGoalsVC, animated: true, completion: nil)
        }
    
    @IBAction func undoBtnPressed(_ sender: Any) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.undoManager?.undo()
        fetCoreDataObjects()
        tableView.reloadData()
    }
    
    func hideUndoView(){
        self.undoView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.undoView.isHidden = true
            }
    }
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else{
            return UITableViewCell()
        }
        
        let goal = goals[indexPath.row]
        
//        cell.configureCell(description: "Eat ass everyday", type: TypesOfGoal.longTerm, goalProgressAmount: 7)
        cell.configureCell(goal: goal)
        return cell
    }
    
    // so that we can edit tableView and others are added in the end to detlete a cell
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "DELETE", handler: {(_,_,comletionHandler) in
            comletionHandler(true)
            self.remove(atIndexPath: indexPath)
            self.fetCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        })
        let refreshAction = UIContextualAction(style: .normal, title: "SET TO 0", handler: {(_,_,completionHandler) in
            self.refresh(atIndex: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        })

        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        refreshAction.backgroundColor = #colorLiteral(red: 0.8765824437, green: 0.7821138501, blue: 0, alpha: 1)

        
        let config = UISwipeActionsConfiguration(actions: [deleteAction, refreshAction])
        
        return config
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "ADD", handler: {(_,_,completionHandler) in
            self.setProgress(indexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        })
        
        addAction.backgroundColor = #colorLiteral(red: 0.27791363, green: 0.872631669, blue: 0.4359583855, alpha: 1)
        
        let config = UISwipeActionsConfiguration(actions: [addAction])
        return config
    }
}


extension GoalsVC{
    
    func setProgress(indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let chosenGoal = goals[indexPath.row]
        
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue{
            chosenGoal.goalProgress += 1
        }
        else {return}
        do {
            try managedContext.save()
            print("Successuly set progress")
        } catch  {
            debugPrint("Could not set progress \(error.localizedDescription)")
        }
    }
    
    func remove(atIndexPath indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        managedContext.undoManager = UndoManager()
        deletedItem = goals[indexPath.row]

        managedContext.delete(goals[indexPath.row])
        do {
            try managedContext.save()
            print("Successfully removed item!!!")
            self.hideUndoView()
        } catch  {
            debugPrint("Could't save after delete")
        }
    }
    
    func refresh(atIndex indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let chosenGoal = goals[indexPath.row]
        
        chosenGoal.goalProgress = 0
        do {
            try managedContext.save()
            print("Successuly set progress")
        } catch  {
            debugPrint("Could not set progress \(error.localizedDescription)")
        }
        
    }
        
    func fetch(completion: (_ complete: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchRequest)
            print("Successfully fetched data!")
            completion(true)
            
        } catch  {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
}

//for transition
extension GoalsVC: UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentTransition()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransition()
    }
    
}

