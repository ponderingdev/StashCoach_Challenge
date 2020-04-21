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

}
