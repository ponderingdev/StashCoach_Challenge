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
    
    var response: AchievementsResponse?
    
   
    func achievementsFetched(_ rspnse:AchievementsResponse?) {
        if let data = rspnse {
            response = data
            
            view?.list = data.achievements
            view?.title = data.overview.title
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
