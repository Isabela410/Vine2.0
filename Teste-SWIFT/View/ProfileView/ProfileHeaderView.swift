//
//  ProfileHeaderView.swift
//  Teste-SWIFT
//
//  Created by izabour Azevedo on 12/02/25.
//

import UIKit

class ProfileHeaderView: UICollectionReusableView {

    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var viewCommunityButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var communitiesCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var postsCountLabel: UILabel!
    @IBOutlet weak var communityButton: UIButton!
    @IBOutlet weak var MyPhotoUser: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func followUser(_ sender: UIButton) {
        sender.isSelected.toggle()
           if sender.isSelected {
               sender.setTitle("Following", for: .normal)
               sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
               sender.backgroundColor = .systemGray
           } else {
               sender.setTitle("Follow", for: .normal)
               sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
               sender.backgroundColor = .systemBlue
           }
    }
    @IBAction func ViewCommunity(_ sender: UIButton) {
        print("Botão View CommunityProfile clicado!")
    }
}
