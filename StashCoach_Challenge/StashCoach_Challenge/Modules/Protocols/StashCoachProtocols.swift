//
//  StashCoachProtocols.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/18/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit



protocol PresenterToViewProtocol: class {
    func displayCollectionView()
    func displayError()
}

protocol InteractorToPresenterProtocol : class{
    func achievementsFetched()
    func achievementsFetchFailed()
}

protocol PresenterToInteractorProtocol: class{
    func readJSON()
    var presenter: InteractorToPresenterProtocol?{get set}
}
protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol?{ get set}
    var interactor: PresenterToInteractorProtocol?{get set}
    var router: PresenterToRouterProtocol?{get set}
    func updateView()
}
protocol PresenterToRouterProtocol: class {
//    func setUp() -> UIViewController
    func setUp()
}
