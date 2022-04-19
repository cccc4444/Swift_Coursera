//
//  LeagueVCViewController.swift
//  app-swoosh
//
//  Created by Danylo Kushlianskyi on 19.04.2022.
//

import UIKit

class LeagueVC: UIViewController {

    var instancePlayer: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        instancePlayer = Player()
    }
    
    // being called always before the viewDidLoad()
    // here we transmit the desired league data from LeagueVC to SkillVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let skillVC = segue.destination as? SkillVC{
            skillVC.instancePlayer = instancePlayer
        }
    }
    
    
    @IBAction func onNextTapped(_ sender: Any) {
        performSegue(withIdentifier: "toSkillVCSehue", sender: self)
    }
    
    @IBAction func onMensTapped(_ sender: Any) {
        selectLeague(leagueType: "mens")
        
    }
    @IBAction func onWomensTapped(_ sender: Any) {
        selectLeague(leagueType: "womens")
    }
    @IBAction func onCoedTapped(_ sender: Any) {
        selectLeague(leagueType: "coed")
    }
    
    func selectLeague(leagueType: String){
        instancePlayer.desiredLeague = leagueType
        nextBtn.isEnabled = true
    }
    
    @IBOutlet weak var nextBtn: BorderButton!
}
