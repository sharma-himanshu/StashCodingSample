//
//  GenericViewController.swift
//  Stash Coding Sample
//
//  Created by Himanshu Sharma on 11/16/20.
//  Copyright © 2020 Stash. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController {
    
    var spinner:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showErrorMessage() {
        let alert = UIAlertController(title: "Alert", message: "Loading Achievements Failed", preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension GenericViewController {
    func showSpinner() {
        let spinnerView = UIView.init(frame: self.view.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let activityIndicator  = UIActivityIndicatorView.init(style:.large)
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        
        DispatchQueue.main.async { [unowned self] in
            spinnerView.addSubview(activityIndicator)
            self.view.addSubview(spinnerView)
        }
        
        spinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async { [unowned self] in
            self.spinner?.removeFromSuperview()
            self.spinner = nil
        }
    }
}
