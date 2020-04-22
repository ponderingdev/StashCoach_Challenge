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
    
    
    
    //TODO: make one block, two is not neccary
                   
    func getImage(_ url:URL, success: @escaping(UIImage)->Void, failure: @escaping(UIImage)->Void){
        
//        let happyCat = URL(string: "https://i.imgur.com/cdkydjg.jpg")
        
        /// first look in the dictionary
        
        if let image = loadedImages?[url]{
            success(image)
        }
        
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let _ = data, error == nil else {
                failure(UIImage(named: "stash_challenge_sad_cat")!)
                return
            }
            
            
            success(UIImage(named: "happy_cat")!)
        }
        dataTask?.resume()
        
    }
    
    func loadImage(_ url:URL, completion: @escaping(UIImage)->Void){
        
        if let image = loadedImages?[url]{
            completion(image)
        }
            
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                completion(UIImage(named: "stash_challenge_sad_cat")!)
                return
            }
            completion(UIImage(data: data)!)
        })
    }
    

}
