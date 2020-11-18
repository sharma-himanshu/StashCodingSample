//
//  AchievementsListRouter.swift
//  Stash Coding Sample
//
//  Created by Himanshu Sharma on 11/16/20.
//  Copyright © 2020 Stash. All rights reserved.
//

import UIKit

class AchievementsListRouter: ListRouterProtocol {
    
    static func createListModule() -> GenericViewController {
        let view: AchievementsListViewController = AchievementsListViewController()
        let presenter: ListPresenterProtocol & InteractorProtocol = AchievementsListPresenter()
        let interactor = AchievementsInteractor()
        let router: ListRouterProtocol = AchievementsListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
}
