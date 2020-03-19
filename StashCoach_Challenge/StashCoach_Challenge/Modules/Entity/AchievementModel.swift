//
//  AchievementModel.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/19/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit

struct AchievementModel: Codable {
        let id: Int
        let level: String
        let progress: Int
        let total: Int
        let bg_image_url: String
        let accessible: Bool
    
}
