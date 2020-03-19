//
//  StashCoachRouter.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/18/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit

class StashCoachRouter: PresenterToRouterProtocol {
    
//    let presenter
    
    func setUp() {

        let collectionView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "StashViewController") as StashCoachCollectionViewController

        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = StashCoachPresenter()
        let interactor: PresenterToInteractorProtocol = StashCoachInteractor()
        let router: PresenterToRouterProtocol = StashCoachRouter()
    
        
        collectionView.presenter = presenter
//        presenter.view = collectionView
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        
        
        
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    

}
