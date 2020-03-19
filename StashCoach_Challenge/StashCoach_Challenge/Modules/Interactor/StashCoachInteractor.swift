//
//  StashCoachInteractor.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/18/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit

class StashCoachInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?

    
    // uses the Entity to 
    func readJSON() {
        presenter?.achievementsFetched()
    }

}