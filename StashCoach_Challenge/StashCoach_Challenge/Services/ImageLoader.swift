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
    
    
                   
                   
    func getImage(_ url:URL, success: @escaping(UIImage)->Void){
        
//        let imgUrl = URL(string: url)!
        
        /// first look in the dictionary
        
        if let image = loadedImages?[url]{
            success(image)
        }
        
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            
//            success(data)
        }
        dataTask?.resume()
        
//        dataTask  = URLSession.shared.dataTask(with: imgUrl) { (data, response, error) in
//                guard let data = data else { return }
//            DispatchQueue.main.async {
//                completion(data
//                )
//            }
//        }
//        task.resume()
//
    }
    

}
