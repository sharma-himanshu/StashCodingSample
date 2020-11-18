//
//  File.swift
//  Stash Coding Sample
//
//  Created by Himanshu Sharma on 11/16/20.
//  Copyright © 2020 Stash. All rights reserved.
//

import Foundation

class AchievementsListPresenter: ListPresenterProtocol {
    
    weak var view: ListViewProtocol?
    var interactor: AchievementsInteractor?
    var router: ListRouterProtocol?
    
    func loadData() {
        view?.showLoading()
        interactor?.fetchAchievements()
    }
}

extension AchievementsListPresenter: InteractorProtocol
{
    func fetchAchievementsListSuccess(achievements: [AchievementModel]) {
        view?.hideLoading()
        view?.showAchievements(with: achievements)
    }
    
    func fetchFailure() {
        view?.hideLoading()
        view?.showError()
    }
}
