//
//  AchievementsInteractor.swift
//  Stash Coding Sample
//
//  Created by Himanshu Sharma on 11/16/20.
//  Copyright © 2020 Stash. All rights reserved.
//

import Foundation

class AchievementsInteractor {
    
    weak var presenter: InteractorProtocol?
    
    func fetchAchievements() {        
        do {
            if let bundlePath = Bundle.main.path(forResource: "achievements", ofType: "json") {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: bundlePath))
                let achievementsResponse = try JSONDecoder().decode(AchievementsListResponseModel.self, from:jsonData)
                self.presenter?.fetchAchievementsListSuccess(achievements: achievementsResponse.achievements)

            }
        } catch {
            print(error)
            self.presenter?.fetchFailure()
        }
    }
    
}
