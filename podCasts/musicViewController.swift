//
//  musicViewController.swift
//  podCasts
//
//  Created by Mohan K on 04/01/23.
//

import UIKit

class musicViewController: UIViewController {

    var topicData:[Topic] = []
    
    fileprivate var currentPage: Int = 0 {
        didSet {
          
        }
    }
    
    @IBOutlet weak var musicCollectionView: UICollectionView!
    
    @IBOutlet weak var trackCollectionView: UICollectionView!
    
    
    fileprivate var cardSize: CGSize {
        let layout = musicCollectionView.collectionViewLayout as! ScrollCardCollectionViewLayout
        var cardSize = layout.itemSize
        cardSize.width = cardSize.width + layout.minimumLineSpacing
        return cardSize
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        musicCollectionView.register(UINib(nibName: "topicCollectionViewCell", bundle: nil),
        forCellWithReuseIdentifier: "topicCollectionViewCell")
        trackCollectionView.register(UINib(nibName: "localcoverinfoCollectionViewCell", bundle: nil),
        forCellWithReuseIdentifier: "localcoverinfoCollectionViewCell")
        
        musicCollectionView.clipsToBounds = false
        trackCollectionView.clipsToBounds = false
        
        topicData = Topic.fetchTopicData()
        
        musicCollectionView.delegate = self
        musicCollectionView.dataSource = self
        
        trackCollectionView.delegate = self
        trackCollectionView.dataSource = self
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension musicViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topicData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == musicCollectionView {
            let cells = musicCollectionView.dequeueReusableCell(withReuseIdentifier: "topicCollectionViewCell", for: indexPath) as! topicCollectionViewCell
            cells.topic.text = topicData[indexPath.row].topicname
            
            return cells
        }else if collectionView == trackCollectionView {
            let cell = trackCollectionView.dequeueReusableCell(withReuseIdentifier: "localcoverinfoCollectionViewCell", for: indexPath) as! localcoverinfoCollectionViewCell
            
            
            cell.songImage.image = topicData[indexPath.row].image
            cell.contentView.layer.cornerRadius = 15.0
            cell.contentView.layer.masksToBounds = true
            
            cell.songImage.layer.shadowColor = UIColor.lightGray.cgColor
            cell.songImage.layer.shadowOffset = CGSize(width: 10, height: 10)
            cell.songImage.layer.shadowRadius = 20
            cell.songImage.layer.shadowOpacity = 0.2
            cell.songImage.layer.masksToBounds = false
            cell.songImage.layer.shadowPath = UIBezierPath(roundedRect: cell.songImage.layer.bounds, cornerRadius: cell.songImage.layer.cornerRadius).cgPath
            return cell
        }
        return UICollectionViewCell()
    }
    
    
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == musicCollectionView {
            
            return CGSize(width: 150, height: 150)
            
        }
        else if collectionView == trackCollectionView {
            
            return CGSize(width: 250, height: 410)
        }
        return CGSize()

    }
        
}

extension musicViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let carSide = self.cardSize.width
        let offset = scrollView.contentOffset.x
        currentPage = Int(floor((offset - carSide / 2) / carSide) + 1)
    }
}
