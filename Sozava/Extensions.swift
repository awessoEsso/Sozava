//
//  Extensions.swift
//  Sozava
//
//  Created by Esso Awesso on 07/03/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView{
    
    
    func loadImageUsingCacheWithUrlString(urlString: String){
        
        self.image = nil
        
        // Check cache for image firs
        
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
            self.image = cachedImage
            return
        }
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil{
                print(error!)
                return
            }
            DispatchQueue.main.async {
                
                if let downloadedImage = UIImage(data: data!){
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    self.image = downloadedImage
                }
                
                
            }
            
            
        }).resume()
    }
}
