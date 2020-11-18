//
//  GenericLabel.swift
//  Stash Coding Sample
//
//  Created by Himanshu Sharma on 11/16/20.
//  Copyright © 2020 Stash. All rights reserved.
//

import UIKit

class GenericLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit(){
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
    }
}
