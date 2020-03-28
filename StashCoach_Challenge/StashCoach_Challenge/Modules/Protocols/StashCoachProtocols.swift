//
//  StashCoachProtocols.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/18/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit



protocol PresenterToViewProtocol: class {
    var list: [AchievementModel]?{get set}
    var title: String?{get set}
    func displayCollectionView()
    func displayError()
}

protocol InteractorToPresenterProtocol : class{
    var response: AchievementsResponse?{get set}
    func achievementsFetched(_ response:AchievementsResponse?)
//    func achievementsFetchFailed()
}

protocol PresenterToInteractorProtocol: class{
    func readJSON(_ path:String, _ filetype:String)
    var presenter: InteractorToPresenterProtocol?{get set}
}
protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol?{ get set}
    var interactor: PresenterToInteractorProtocol?{get set}
    var router: PresenterToRouterProtocol?{get set}
    func updateView()
}
protocol PresenterToRouterProtocol: class {
    func setUp()
}
