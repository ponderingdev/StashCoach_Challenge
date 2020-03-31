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

    
    func readJSON(_ path:String, _ filetype:String) {
    
        guard let mainUrl = Bundle.main.url(forResource: path, withExtension: filetype)
            else { return }
        do{
            
        let jsonData = try Data(contentsOf: mainUrl)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let response = try decoder.decode(AchievementsResponse.self, from: jsonData)
            presenter?.achievementsFetched(response)
        } catch{
            presenter?.achievementsFetched(nil)
        }
        
    }

}
