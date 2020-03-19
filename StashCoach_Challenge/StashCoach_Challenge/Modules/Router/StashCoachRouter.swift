//
//  StashCoachRouter.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/18/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit

class StashCoachRouter: PresenterToRouterProtocol {
    
    let presenter: StashCoachPresenter
    
    init() {
        self.presenter = StashCoachPresenter()
        
    }
    
    func setUp() {

        let collectionView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "StashViewController") as StashCoachCollectionViewController

        let interactor: PresenterToInteractorProtocol = StashCoachInteractor()
        let router: PresenterToRouterProtocol = StashCoachRouter()
    
        
        collectionView.presenter = self.presenter
        self.presenter.view = collectionView
        self.presenter.router = router
        self.presenter.interactor = interactor
        interactor.presenter = self.presenter
        
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    

}
