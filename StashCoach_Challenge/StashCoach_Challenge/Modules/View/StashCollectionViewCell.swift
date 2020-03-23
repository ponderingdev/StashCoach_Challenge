//
//  StashCollectionViewCell.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/18/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit

class StashCollectionViewCell: UICollectionViewCell {
    
    
//    var index : IndexPath!
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var circularView: UIView!
    
    @IBOutlet var progressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.contentMode = UIView.ContentMode.scaleToFill
        
       circularView.layer.cornerRadius = circularView.frame.size.width/2
       circularView.clipsToBounds = true
        circularView.alpha = 0.85
        
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true

//        progressView.layer.cornerRadius = 8.0
//        progressView.clipsToBounds = true
        
        
    }
    
    override func prepareForReuse() {
        imageView.image = nil //clears image away but imageView doesn't fuck up cellsize
    }
    
    
    func getImage(_ url:String, completion: @escaping(Data)->Void){
        
        let imgUrl = URL(string: url)!
        
        let task = URLSession.shared.dataTask(with: imgUrl) { (data, response, error) in
                guard let data = data else { return }
            DispatchQueue.main.async {
                completion(data
                )
            }
        }
        task.resume()
    
    }
    
}
