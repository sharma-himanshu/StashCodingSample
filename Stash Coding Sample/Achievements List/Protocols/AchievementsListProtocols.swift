//
//  AchievementsListProtocols.swift
//  Stash Coding Sample
//
//  Created by Himanshu Sharma on 11/13/20.
//  Copyright © 2020 Stash. All rights reserved.
//

import UIKit

protocol InteractorProtocol: class {
    func fetchAchievementsListSuccess(achievements:[AchievementModel])
    func fetchFailure()
}

protocol ListViewProtocol: class {
    var presenter:ListPresenterProtocol? { get set }
    
    func showAchievements(with achievements: [AchievementModel])
    func showError()
    func showLoading()
    func hideLoading()
}

protocol ListPresenterProtocol: class {
    var view: ListViewProtocol? { get set }
    var interactor: AchievementsInteractor? { get set }
    var router: ListRouterProtocol? { get set }
    
    func loadData()
}
    
protocol ListRouterProtocol: class {
    static func createListModule() -> GenericViewController
}
