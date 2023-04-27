//
//  topicCollectionViewCell.swift
//  podCasts
//
//  Created by Mohan K on 04/01/23.
//

import UIKit

class topicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topic: UILabel!
    
    static let identifier = "topicCollectionViewCell"
    
    static func nib() -> UINib {
        
        return UINib(nibName: "topicCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
