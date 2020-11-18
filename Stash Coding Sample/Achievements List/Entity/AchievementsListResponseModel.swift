//
//  AchievementsListResponseModel.swift
//  Stash Coding Sample
//
//  Created by Himanshu Sharma on 11/13/20.
//  Copyright © 2020 Stash. All rights reserved.
//

import Foundation

struct AchievementsListResponseModel: Decodable {
    let success: Bool
    let status: Int
    let overview: OverviewModel
    let achievements: [AchievementModel]
}

struct OverviewModel: Decodable {
    let title: String
}
