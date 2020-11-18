//
//  UIExtensions.swift
//  Stash Coding Sample
//
//  Created by Himanshu Sharma on 11/16/20.
//  Copyright © 2020 Stash. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func setImage(from url: URL) {
        
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) {
            self.image = imageFromCache as? UIImage
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let imageToCache = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                imageCache.setObject(imageToCache, forKey: url as AnyObject)
                self.image = imageToCache
                self.alpha = 0
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                    self.alpha = 1
                    },
                completion:nil)
            }
        }.resume()
    }
}
