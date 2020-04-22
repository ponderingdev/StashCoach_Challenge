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
    var loadedImages: [URL: UIImage]?


    
    func loadImage(_ url:URL, completion: @escaping(UIImage)->Void){
        
        if let image = loadedImages?[url]{
            print("This image exists!")
            completion(image)
        }
            
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                completion(UIImage(named: "stash_challenge_sad_cat")!)
                return
            }
//            completion(UIImage(data: data)!)
            completion(UIImage(named: "stash_challenge_sad_cat")!)

        })
        dataTask?.resume()
    }
    

}
