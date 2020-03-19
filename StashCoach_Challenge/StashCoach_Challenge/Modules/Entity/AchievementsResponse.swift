//
//  AchievementsResponse.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/19/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit

struct AchievementsResponse: Codable {
    let success: Bool
    let status: Int

    
    struct Overview: Codable {
        let title: String
    }
    
    let overview: Overview
    let achievements: [AchievementModel]
}
