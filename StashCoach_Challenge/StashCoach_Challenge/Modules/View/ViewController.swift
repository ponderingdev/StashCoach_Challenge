//
//  ViewController.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/16/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    

    @IBAction func beginButton(_ sender: Any) {
        
        let router = StashCoachRouter()
        router.setUp()
        
//        let collectionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "StashViewController") as StashCoachCollectionViewController
//        self.navigationController?.pushViewController(pr, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

