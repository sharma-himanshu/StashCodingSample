//
//  Stash_Coding_SampleTests.swift
//  Stash Coding SampleTests
//
//  Created by Himanshu Sharma on 11/13/20.
//  Copyright © 2020 Stash. All rights reserved.
//

import XCTest
@testable import Stash_Coding_Sample

class LoadAchievementsTest: XCTestCase {
    func testAchievementDecoding() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Achievements", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return
        }
        
        let decoder = JSONDecoder()
        guard let achievementsResponse = try? decoder.decode(AchievementsListResponseModel.self, from: data) else {
            return
        }
        
        XCTAssertEqual(achievementsResponse.status, 200)
        XCTAssertEqual(achievementsResponse.success, true)
        XCTAssertEqual(achievementsResponse.achievements.count, 3)
    }
}
