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
    
    var overviewTitle: String?
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
//        return list?.count ?? 0
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath) as! StashCollectionViewCell
        
        
//        cell.getImage(list![indexPath.section].bg_image_url, completion: { imageData in
//                cell.imageView.image = UIImage(data: imageData)
//            })
    
        /// passing happy cat url
        
        let happyCatURL = URL(string: "https://i.imgur.com/cdkydjg.jpg")!
        
        let imgLoader = ImageLoader()
        
        
        
        imgLoader.smarterImageLoader(happyCatURL) { (image) in
                cell.imageView.image = image
            print(imgLoader.loadedImages.count)
        }
        
        
        print("inside cellForRow:\(imgLoader.loadedImages.count)") // this prints 0
        
        
        
        if  !list![indexPath.section].accessible {
            for view in cell.contentView.subviews{
                //skip circle view
                if view.tag == 1{
                    view.alpha = 0.9
                    for label in view.subviews{
                        label.alpha = 0.5
                    }
                    continue
                }
                view.alpha = 0.5
            }
            
        }
        
        
        cell.numericLevel.text = list![indexPath.section].level
        
        cell.progressView.observedProgress = Progress(totalUnitCount: Int64(list![indexPath.section].total))
        cell.progressView.observedProgress?.completedUnitCount = Int64(list![indexPath.section].progress)
    
                
        cell.progressLabel.text = String(list![indexPath.section].progress) + "pts"
        cell.totalLabel.text = String(list![indexPath.section].total) + "pts"
        

        return cell
    }
}

    extension StashCoachCollectionViewController : UICollectionViewDelegateFlowLayout {
      
      func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellwidth = view.frame.width - 50.0
        
        if (UIDevice.current.userInterfaceIdiom == .phone){
            return CGSize(width: cellwidth, height: cellwidth - 125.0)

        }
        else {
            return CGSize(width: cellwidth, height: cellwidth - 300.0)
        }
        

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
    }
    
    func displayError() {
        
    }
    
    
}


