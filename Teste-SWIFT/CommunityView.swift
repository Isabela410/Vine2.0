//
//  CommunityView.swift
//  Teste-SWIFT
//
//  Created by izabour Azevedo on 11/02/25.
//

import Foundation
import UIKit

class CommunityView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myID", for: indexPath) as! CommunityViewCell
        cell.videosUser.image = UIImage(named: "vine 1")
        return cell
    }
    
    @IBOutlet weak var CommuinityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CommuinityCollectionView.delegate = self
        CommuinityCollectionView.dataSource = self
        
        
        let cellXib = UINib(nibName: "CommunityViewCell", bundle: nil)
        CommuinityCollectionView.register(cellXib, forCellWithReuseIdentifier: "myID")
        
        
        let headerXib = UINib(nibName: "ProfileHeaderView", bundle: nil)
        CommuinityCollectionView.register(headerXib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeader")
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        let width = (view.frame.size.width - 4) / 3
        layout.itemSize = CGSize(width: width, height: width)
        layout.headerReferenceSize = CGSize(width: view.frame.size.width, height: 200)
        CommuinityCollectionView.collectionViewLayout = layout
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeader", for: indexPath) as! ProfileHeaderView
            header.MyPhotoUser .image = UIImage(named: "vine 1")
            header.nameLabel.text = "UserName"
            header.usernameLabel.text = "@userName"
            header.postsCountLabel.text = "20 Post"
            header.communitiesCountLabel.text = "40 Communities"
            header.followersCountLabel.text = "10 Followers"
            header.followButton.backgroundColor = .systemBlue
            header.followButton.layer.cornerRadius = 5
            header.followButton.setTitleColor(.white, for: .normal)
            return header
        }
        return UICollectionReusableView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
}
