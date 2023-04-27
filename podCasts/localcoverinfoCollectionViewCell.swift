//
//  localcoverinfoCollectionViewCell.swift
//  podCasts
//
//  Created by Mohan K on 04/01/23.
//

import UIKit

class localcoverinfoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var songImage: UIImageView!
    
    static let identifier = "localcoverinfoCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "localcoverinfoCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
