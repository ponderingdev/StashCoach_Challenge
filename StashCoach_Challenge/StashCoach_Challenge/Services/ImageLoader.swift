//
//  ImageLoader.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 4/21/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit

class ImageLoader: NSObject {
    
      var dataTask: URLSessionTask?
//    will create simple 'cache' to store url and image
     var loadedImages = [URL: UIImage]()
    
    
    func loadImage(_ url:URL, completion: @escaping(UIImage)->Void){
        
        
        if let image = loadedImages[url]{
            print("This image exists!")
            completion(image)
        }
            
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, response, error in
            guard let image = UIImage(data: data!), error == nil else {
                completion(UIImage(named: "stash_challenge_sad_cat")!)
                return
            }
            DispatchQueue.main.async {
                self?.loadedImages[url] = image
                print(self?.loadedImages[url]) /// self is nil hence loaded images is nil
//                completion((self?.loadedImages[url])!) // this is run time error
                completion(image) // this works fine

            }
         
        })
        dataTask?.resume()
    }
    

}
