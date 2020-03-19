//
//  StashCoachPresenter.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/18/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit

class StashCoachPresenter: ViewToPresenterProtocol, InteractorToPresenterProtocol{
    
    var view: PresenterToViewProtocol?
       
    var interactor: PresenterToInteractorProtocol?
       
    var router: PresenterToRouterProtocol?
   
    func achievementsFetched() {
        view?.displayCollectionView()
    }
    
    func achievementsFetchFailed() {
        print("fun")
    }
    
    func updateView() {
        interactor?.readJSON()
    }
    
    

}
