//
//  StashCollectionViewCell.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/18/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit

class StashCollectionViewCell: UICollectionViewCell {
    
        
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var circularView: UIView!
    
    @IBOutlet var progressView: UIProgressView!
    
    @IBOutlet var numericLevel: UILabel!
    @IBOutlet var progressLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    
    
    
    @IBOutlet var spaceFromTopCircleViewToParentView: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.contentMode = UIView.ContentMode.scaleToFill
        
//       circularView.layer.cornerRadius = circularView.frame.size.width/2
//       circularView.clipsToBounds = true
//        circularView.alpha = 0.85
        
        
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true

        progressView.layer.cornerRadius = 5
        progressView.clipsToBounds = true
        
    }
    
    // if not used when more cells than screen can show, image will be distorted
    override func prepareForReuse() {
        imageView.image = nil
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circularView.layer.cornerRadius = circularView.frame.size.width/2
        circularView.clipsToBounds = true
        circularView.alpha = 0.85
        
        // add bit more space from top of circle to contentview
        if (UIDevice.current.userInterfaceIdiom == .pad){
            spaceFromTopCircleViewToParentView.constant = 75
        }
        
//        numericLevel.sizeToFit()
        
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
