//
//  CommunityView.swift
//  Teste-SWIFT
//
//  Created by izabour Azevedo on 11/02/25.
//

import Foundation
import UIKit

import UIKit

class CommunityView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myID", for: indexPath) as! CommunityViewCell
        cell.videosUser.image = UIImage(named: "vine 1")
        cell.videosUser.layer.cornerRadius = 5
        cell.videosUser.clipsToBounds = true
        return cell
    }
    
    @IBOutlet weak var CommuinityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CommuinityCollectionView.delegate = self
        CommuinityCollectionView.dataSource = self

        
        // Registre a célula
        let cell = UINib(nibName: "CommunityViewCell", bundle: nil)
        CommuinityCollectionView.register(cell, forCellWithReuseIdentifier: "myID")
        let header = UINib(nibName: "CommunityHeaderViewCollectionReusableView", bundle: nil)
        CommuinityCollectionView.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CommunityHeader")
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        let width = (view.frame.size.width - 4) / 3
        layout.itemSize = CGSize(width: width, height: width)
        CommuinityCollectionView.collectionViewLayout = layout
    }

        
    }
    
    
       func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           if kind == UICollectionView.elementKindSectionHeader {
               let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CommunityHeader", for: indexPath) as! CommunityHeaderViewCollectionReusableView
             header.contentMode = .scaleAspectFill
               header.clipsToBounds = true
               header.countPosts.text = "12"
               header.countPosts.font = UIFont.systemFont(ofSize: 14, weight: .bold)
               header.namecomummunity.text = "Community"
               header.followCommunity.setTitle("Follow", for: .normal)
               header.photoCommunity.image = UIImage(named: "vine 1")
               
               return header
           }
           return UICollectionReusableView()
       }

     
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           return CGSize(width: collectionView.frame.width,
                         height: collectionView.frame.width / 3)
       }
   
#Preview{
    UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "ComunityView")
}
