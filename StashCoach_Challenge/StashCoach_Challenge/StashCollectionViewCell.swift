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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func getImage(completion: @escaping(Data)->Void){
        
        let imgUrl = URL(string: "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C60F6868-A0CD-4D9D-A3B9-3C460FA989FF.png")!
        
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