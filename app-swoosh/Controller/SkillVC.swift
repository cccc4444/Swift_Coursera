//
//  SkillVC.swift
//  app-swoosh
//
//  Created by Danylo Kushlianskyi on 19.04.2022.
//

import UIKit

class SkillVC: UIViewController {

    var instancePlayer: Player! 
    override func viewDidLoad() {
        super.viewDidLoad()

        if let _ = instancePlayer.desiredLeague {
            print(instancePlayer.desiredLeague!)
        }
    }
    

    @IBAction func onLeagueCV(_ sender: Any) {
        performSegue(withIdentifier: "onLeagueSegue", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
