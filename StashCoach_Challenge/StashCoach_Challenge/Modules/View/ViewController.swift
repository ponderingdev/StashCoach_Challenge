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
        self.navigationController?.pushViewController(router.presenter.view as! StashCoachCollectionViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .white

//        let infoButton = UIButton(type: .infoLight)
//        let infoBarButtonItem = UIBarButtonItem(customView: infoButton)
//        navigationItem.rightBarButtonItem = infoBarButtonItem

    }


}

