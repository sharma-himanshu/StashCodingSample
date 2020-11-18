//
//  AchievementModel.swift
//  Stash Coding Sample
//
//  Created by Himanshu Sharma on 11/13/20.
//  Copyright © 2020 Stash. All rights reserved.
//

import Foundation

struct AchievementModel: Decodable {
    let id: Int
    let level: String
    let progress: Int
    let total: Int
    let imageUrl: URL
    let accessible: Bool
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "bg_image_url"
        case id
        case level
        case progress
        case total
        case accessible
    }
}
