//
//  StashCollectionViewCell.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/18/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit

class StashCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var circularView: UIImageView!
    var index : IndexPath!
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.frame = self.bounds

        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        
//        circularView.backgroundColor = UIColor(white: 1, alpha: 0.5)
//        circularView.layer.cornerRadius = imageView.frame.size.width/2
//        circularView.clipsToBounds = true
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
