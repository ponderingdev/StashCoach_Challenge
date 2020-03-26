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
    private let sectionInsets = UIEdgeInsets(top: 30.0, left: 5.0, bottom: 8.0, right: 5.0)
    var presenter: ViewToPresenterProtocol?
    
    var achievements = [AchievementModel]()
    var data: AchievementsResponse?
    var list: [AchievementModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.updateView()
    
       let infoButton = UIButton(type: .infoLight)
        infoButton.tintColor = .white
        let infoBarButtonItem = UIBarButtonItem(customView: infoButton)
        navigationItem.rightBarButtonItem = infoBarButtonItem

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return self.achievements.count
        return list?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath) as! StashCollectionViewCell
        
    
        cell.getImage(achievements[indexPath.section].bg_image_url, completion: { imageData in
                cell.imageView.image = UIImage(data: imageData)
            })
            
        
        
        if  !achievements[indexPath.section].accessible {
            for view in cell.contentView.subviews{
                //skip circle view
                if view.tag == 1{
//                    view.backgroundColor = .white
                    view.alpha = 0.9
                    for label in view.subviews{
                        label.alpha = 0.5
                    }
//                    print("skipping: \(type(of: view))")
                    continue
                }
//                print("applying transparency to:\(type(of: view))")
                view.alpha = 0.5
            }
            
        }
        
        
        cell.numericLevel.text = achievements[indexPath.section].level
        
        cell.progressView.observedProgress = Progress(totalUnitCount: Int64(achievements[indexPath.section].total))
        cell.progressView.observedProgress?.completedUnitCount = Int64(achievements[indexPath.section].progress)
//        cell.progressView.observedProgress?.back
    
                
        cell.progressLabel.text = String(achievements[indexPath.section].progress) + cell.progressLabel.text!
        cell.totalLabel.text = String(achievements[indexPath.section].total) + cell.totalLabel.text!
        
    
        return cell
    }
}

    extension StashCoachCollectionViewController : UICollectionViewDelegateFlowLayout {
      
      func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellwidth = view.frame.width - 50.0
        
        return CGSize(width: cellwidth, height: cellwidth - 150.0)
        
      }
      
      
      func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return sectionInsets
        }
        
        return UIEdgeInsets(top: 8.0,left: 0,bottom: 8.0,right: 0)
      }
        
    }

extension StashCoachCollectionViewController: PresenterToViewProtocol {
    
    func displayCollectionView() {
        collectionView.reloadData()
        self.title = data!.overview.title
        self.achievements = data!.achievements
        self.list = data!.achievements
        
    }
    
    
    
    func displayError() {
        
    }
    
    
}


