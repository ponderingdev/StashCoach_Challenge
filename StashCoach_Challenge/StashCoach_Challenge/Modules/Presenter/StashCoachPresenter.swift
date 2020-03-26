//
//  StashCoachPresenter.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/18/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//


class StashCoachPresenter: ViewToPresenterProtocol, InteractorToPresenterProtocol{
    
    var view: PresenterToViewProtocol?
       
    var interactor: PresenterToInteractorProtocol?
       
    var router: PresenterToRouterProtocol?
   
    func achievementsFetched(_ response:AchievementsResponse?) {
        if let data = response {
            view?.data = data
            view?.displayCollectionView()

        }
        else {
            view?.displayError()
        }
    }
    
    func updateView() {
        interactor?.readJSON("Achievements", "json")
    }

}
