//
//  MainMenuViewController.swift
//  Scanner
//
//  Created by Eryk Mól on 07.04.19.
//  Copyright © 2019 Eryk Mól. All rights reserved.
//

import UIKit
import CircleMenu

class MainMenuViewController: UIViewController {

    @IBOutlet weak var circleMainMenu: CircleMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage (UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        circleMainMenu.delegate = self
        circleMainMenu.layer.cornerRadius = circleMainMenu.bounds.size.width / 2.0
        circleMainMenu.layer.masksToBounds = true
        circleMainMenu.tintColor = UIColor.white
        // Do any additional setup after loading the view.
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    // MARK: - Navigation

}

extension MainMenuViewController: CircleMenuDelegate {
    
    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int){
        
        button.layer.cornerRadius = button.bounds.size.width / 2.0
        button.layer.masksToBounds = true
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.white
        if atIndex == 0 {
            let Image = UIImage(named: "ScannerIcon.PNG")
            button.setImage(Image, for: .normal)
        } else {
            let Image = UIImage(named: "HistoryIcon.PNG")
            button.setImage(Image, for: .normal)
        }
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonDidSelected button: UIButton, atIndex: Int) {
        if atIndex == 0 {
            performSegue(withIdentifier: "ToScannerSegue", sender: nil)
        } else {
            performSegue(withIdentifier: "ToHistorySegue", sender: nil)
        }
    }
}
