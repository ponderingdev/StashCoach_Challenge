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
    
        guard let mainUrl = Bundle.main.url(forResource: "Achievements", withExtension: "json") else { return }
        do{
            
        let jsonData = try Data(contentsOf: mainUrl)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let response = try decoder.decode(AchievementsResponse.self, from: jsonData)
            presenter?.achievementsFetched(response)
        } catch{
            presenter?.achievementsFetched(nil)
//            print("unable to turn to JSON")
        }
        
    }

}
