//
//  ViewController.swift
//  Stash Coding Sample
//
//  Created by Himanshu Sharma on 11/13/20.
//  Copyright © 2020 Stash. All rights reserved.
//

import UIKit

class AchievementsListViewController: GenericViewController {

    private var achievementsData:[AchievementModel] = []
    var presenter: ListPresenterProtocol?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 130
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AchievementTableViewCell.self, forCellReuseIdentifier: "achievementCell")

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter?.loadData()
        self.setupAndLayoutViews()
    }
    
    func setupAndLayoutViews() {
        self.view.addSubview(tableView)
        
        self.title = "Smart Investing"
        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(infoButtonPressed), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoButton)
        LayoutManager.shared.anchorViews(view: tableView, toView:view)
    }
    
    @objc func infoButtonPressed() {
    //Handle info navigation bar button tap here
    }
}


extension AchievementsListViewController: ListViewProtocol
{
    func showAchievements(with achievements: [AchievementModel]) {
        achievementsData = achievements
        self.tableView.reloadData()
    }
    
    func showError() {
        self.showErrorMessage()
    }
    
    func showLoading() {
        self.showSpinner()
    }
    
    func hideLoading() {
        self.removeSpinner()
    }
}

extension AchievementsListViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievementsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let achievementCell = tableView.dequeueReusableCell(withIdentifier:"achievementCell", for: indexPath) as? AchievementTableViewCell else {
            let achievementCell = AchievementTableViewCell(style: .default, reuseIdentifier:"albumCell")
            return achievementCell
        }
        if achievementCell.achievement == nil {
            achievementCell.achievement = achievementsData[indexPath.row]
        }
        return achievementCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

