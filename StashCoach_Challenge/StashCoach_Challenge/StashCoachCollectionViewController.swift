//
//  StashCoachCollectionViewController.swift
//  StashCoach_Challenge
//
//  Created by Jesus Fabian on 3/17/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import UIKit


class StashCoachCollectionViewController: UICollectionViewController {

    private let reuseIdentifer = "StashCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
//    private let itemsPerRow: CGFloat = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Register cell classes
//        self.collectionView!.register(StashCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifer)

        // Do any additional setup after loading the view.
    }



    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath) as! StashCollectionViewCell
        cell.backgroundColor = .red
//
        cell.getImage { data in
            cell.imageView.image = UIImage(data: data)
        }
//
//        cell.imageView.image =
        // Configure the cell
        
    
        return cell
    }
}

    extension StashCoachCollectionViewController : UICollectionViewDelegateFlowLayout {
      //1
      func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * 10
        let availableWidth = view.frame.width - paddingSpace

        
        
        return CGSize(width: availableWidth, height: availableWidth)
      }
      
      //3
      func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
      }
      
      // 4
      func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
      }
        
    }


