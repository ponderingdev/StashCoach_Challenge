//
//  ImageLoader.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 4/21/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit

class ImageLoader: NSObject {
    
      var dataTask: URLSessionDataTask?
//    will create simple 'cache' to store url and image
    var loadedImages = [URL: UIImage]()
    var urls = [URL]()
    
    
    func smarterImageLoader(_ url:URL, completion: @escaping(UIImage)->Void) {
        /// 1. make network call ad get back image
        /// 2. add to dictioanary if possible
        /// 3. jump on main thread
        
        if let image = loadedImages[url]{
            print("This image exists!")
            DispatchQueue.main.async {
                completion(image)
            }
//            completion(image)
        }
        
        if urls.contains(url){
            // do nothing
        } else{
            print("Will make network call and store to avoid")
            urls.append(url)
            loadImage(url) { image in
                self.loadedImages[url]  = image
                completion(image)
            }
        }

        
    }
    
    
    func loadImage(_ url:URL, completion: @escaping(UIImage)->Void){
        
//        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let image = UIImage(data: data!), error == nil else {
                completion(UIImage(named: "stash_challenge_sad_cat")!)
                return
            }
            completion(image)

        })
        dataTask?.resume()
    }
    

}
