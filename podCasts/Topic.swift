//
//  Topic.swift
//  podCasts
//
//  Created by Mohan K on 04/01/23.
//

import Foundation
import UIKit
struct Topic {
    var topicname: String?
    var image: UIImage?
    
    init(topicname: String, image: UIImage) {
        self.topicname = topicname
        self.image = image
    }
    
//    var song = [Topic]()
    
    static func fetchTopicData() -> [Topic] {
        let topOne = Topic(topicname: "science", image: UIImage(named: "image1")!)
        let topTwo = Topic(topicname: "fiction", image: UIImage(named: "image2")!)
        let topThree = Topic(topicname: "motivation", image: UIImage(named: "image3")!)
        let topFour = Topic(topicname: "creation", image: UIImage(named: "image4")!)
        let topFive = Topic(topicname: "radio", image: UIImage(named: "image5")!)
        let topSix = Topic(topicname: "songs", image: UIImage(named: "image6")!)
        let topSeven = Topic(topicname: "kindle", image: UIImage(named: "image7")!)
        let topEight = Topic(topicname: "podcasts", image: UIImage(named: "image8")!)
        let topNine = Topic(topicname: "spritual", image: UIImage(named: "image9")!)
        let topTen = Topic(topicname: "dreams", image: UIImage(named: "image10")!)
        
        return [topOne, topTwo, topThree, topFour, topFive, topSix, topSeven, topEight, topNine, topTen]
    }
}
