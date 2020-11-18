//
//  AchievementTableViewCell.swift
//  Stash Coding Sample
//
//  Created by Himanshu Sharma on 11/16/20.
//  Copyright © 2020 Stash. All rights reserved.
//

import UIKit

class AchievementTableViewCell: UITableViewCell {
    
    var achievement: AchievementModel? {
        didSet {
            guard let achievementData = achievement else {
                return
            }
            backgroundImageView.setImage(from: achievementData.imageUrl)
            levelValueLabel.text = achievementData.level
            progressBar.progress = Float(achievementData.progress)/Float(achievementData.total)
            progressValueLabel.text = "\(achievementData.progress)pts"
            totalValueLabel.text = "\(achievementData.total)pts"
            disabledView.isHidden = achievementData.accessible
            self.isUserInteractionEnabled = achievementData.accessible
        }
    }
    
    let backgroundImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
       return img
    }()
    
    let levelTextLabel: GenericLabel = {
        let levelLabel = GenericLabel()
        levelLabel.text = "Level"
        return levelLabel
    }()
    
    let levelValueLabel: GenericLabel = {
        let levelValue = GenericLabel()
        levelValue.font = UIFont.boldSystemFont(ofSize: 44)
        return levelValue
    }()
    
    let levelView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let progressValueLabel: GenericLabel = {
        let progressLabel = GenericLabel()
        progressLabel.textColor = .white
        progressLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return progressLabel
    }()
    
    let totalValueLabel: GenericLabel = {
        let totalLabel = GenericLabel()
        totalLabel.textColor = .white
        totalLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return totalLabel
    }()
    
    let progressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .green
        progressView.backgroundColor = .white
        progressView.progress = 0.0
        progressView.layer.cornerRadius = 5.0
        progressView.clipsToBounds = true
        return progressView
    }()
    
    let disabledView: UIView = {
       let disabledView = UIView()
        disabledView.translatesAutoresizingMaskIntoConstraints = false
        disabledView.backgroundColor = .white
        disabledView.alpha = 0.5
        disabledView.isHidden = true
        return disabledView
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(backgroundImageView)
        self.contentView.addSubview(levelView)
        levelView.addSubview(levelTextLabel)
        levelView.addSubview(levelValueLabel)
        self.contentView.addSubview(progressBar)
        self.contentView.addSubview(progressValueLabel)
        self.contentView.addSubview(totalValueLabel)
        self.contentView.addSubview(disabledView)

        backgroundImageView.layer.cornerRadius = 25
        backgroundImageView.clipsToBounds = true
        backgroundImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        LayoutManager.shared.setLeadingAndTrailingAnchorForViews(view: backgroundImageView, toView: self.contentView, constant: 15)
        // Setting aspect ratio constraint based on
        backgroundImageView.heightAnchor.constraint(equalTo: backgroundImageView.widthAnchor, multiplier: 328.0/515).isActive = true
        let bottomAnchorConstraint = backgroundImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        bottomAnchorConstraint.priority = UILayoutPriority(rawValue: 250)
        bottomAnchorConstraint.isActive = true
        
        levelView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor
            , constant: 30).isActive = true
        levelView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        levelView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        levelView.centerXAnchor.constraint(equalTo:self.contentView.centerXAnchor).isActive = true
        levelView.layer.cornerRadius = levelView.frame.size.width / 2
        levelView.clipsToBounds = true
        
        levelTextLabel.topAnchor.constraint(equalTo: levelView.topAnchor, constant: 20).isActive = true
        levelTextLabel.centerXAnchor.constraint(equalTo:levelView.centerXAnchor).isActive = true
        
        levelValueLabel.topAnchor.constraint(equalTo: levelTextLabel.bottomAnchor, constant: -5).isActive = true
        levelValueLabel.centerXAnchor.constraint(equalTo:levelTextLabel.centerXAnchor).isActive = true

        LayoutManager.shared.setLeadingAndTrailingAnchorForViews(view: progressBar, toView: backgroundImageView, constant: 25)
        progressBar.topAnchor.constraint(equalTo: levelView.bottomAnchor, constant: 30).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        progressValueLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 10).isActive = true
        progressValueLabel.leadingAnchor.constraint(equalTo: progressBar.leadingAnchor).isActive = true
        
        totalValueLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 10).isActive = true
        totalValueLabel.trailingAnchor.constraint(equalTo: progressBar.trailingAnchor).isActive = true
        
        LayoutManager.shared.anchorViews(view: disabledView, toView: self.contentView)

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundImageView.image = nil
        achievement = nil
    }
}

