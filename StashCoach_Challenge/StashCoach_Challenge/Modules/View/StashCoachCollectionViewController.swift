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
    private let sectionInsets = UIEdgeInsets(top: 30.0, left: 20.0, bottom: 1.0, right: 20.0)
    var presenter: ViewToPresenterProtocol?
    
    var achievements = [AchievementModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.updateView()
        
        // Register cell classes
//        self.collectionView!.register(StashCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifer)

       let infoButton = UIButton(type: .infoLight)
        infoButton.tintColor = .white
        let infoBarButtonItem = UIBarButtonItem(customView: infoButton)
        navigationItem.rightBarButtonItem = infoBarButtonItem

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        print(achievements.count)
        return self.achievements.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath) as! StashCollectionViewCell
        
        
        cell.imageView.backgroundColor = .systemPink
    
        cell.getImage(achievements[indexPath.section].bg_image_url, completion: { imageData in
                cell.imageView.image = UIImage(data: imageData)
            })
            
        
        if  !achievements[indexPath.section].accessible {
            cell.imageView.alpha = 0.5
        }
    
        return cell
    }
}

    extension StashCoachCollectionViewController : UICollectionViewDelegateFlowLayout {
      
      func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * 10
        let availableWidth = view.frame.width - paddingSpace
        
        return CGSize(width: availableWidth * 1.5, height: availableWidth)
        
      }
      
      
      func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
      }
        
    }

extension StashCoachCollectionViewController: PresenterToViewProtocol {
    
    func displayCollectionView(_ title:String, _ data:[AchievementModel]) {
        collectionView.reloadData()
        self.title = title
        self.achievements = data
    }
    
    func displayError() {
        
    }
    
    
}


