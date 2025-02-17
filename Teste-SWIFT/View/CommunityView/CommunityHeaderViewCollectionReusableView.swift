//
//  CommunityHeaderViewCollectionReusableView.swift
//  Teste-SWIFT
//
//  Created by izabour Azevedo on 13/02/25.
//

import UIKit

class CommunityHeaderViewCollectionReusableView: UICollectionReusableView {



    @IBOutlet weak var photoCommunity: UIImageView!
    @IBOutlet weak var followCommunity: UIButton!
    @IBOutlet weak var countPosts: UILabel!
    @IBOutlet weak var namecomummunity: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    @IBAction func followCommunity(_ sender: UIButton) {
        sender.isSelected.toggle()
           if sender.isSelected {
               sender.setTitle("Following", for: .normal)
               sender.backgroundColor = .systemGray
           } else {
               sender.setTitle("Follow", for: .normal)
               sender.backgroundColor = .systemBlue
           }
    }

}
