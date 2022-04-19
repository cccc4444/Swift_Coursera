//
//  ViewController.swift
//  app-swoosh
//
//  Created by Danylo Kushlianskyi on 17.04.2022.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        swooshLogo.frame = CGRect(x: view.frame.size.width / 2 - swooshLogo.frame.size.width / 2, y: 50, width: swooshLogo.frame.size.width, height: swooshLogo.frame.size.height)
//
//        bgpicture.frame = view.frame

    }

    @IBOutlet weak var swooshLogo: UIImageView!
    
    @IBOutlet weak var bgpicture: UIImageView!
    
    @IBOutlet weak var Text: UILabel!
    
    @IBAction func UnwindFromSkillVC (unwindSegue: UIStoryboardSegue){
        
    }
    
    
}

