//
//  FeedUserViewCell.swift
//  Teste-SWIFT
//
//  Created by izabour Azevedo on 18/02/25.
//

import UIKit

class FeedUserViewCell: UICollectionViewCell {

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var verComunidade: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var hastagVideo: UILabel!
    @IBOutlet weak var descriptionVideo: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func islikeButton(_ sender: Any) {
    }
    @IBAction func isShareButton(_ sender: Any) {
    }
    @IBAction func cameraVideo(_ sender: Any) {
    }
    @IBAction func viewCommunity(_ sender: Any) {
    }
}
