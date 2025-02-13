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
        cell.videosUser.image = UIImage(named: "user")
        cell.videosUser.layer.cornerRadius = 5
        cell.videosUser.clipsToBounds = true
        return cell
    }
    
    @IBOutlet weak var CommuinityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CommuinityCollectionView.delegate = self
        CommuinityCollectionView.dataSource = self

        // Registra a célula
        let cellXib = UINib(nibName: "CommunityViewCell", bundle: nil)
        CommuinityCollectionView.register(cellXib, forCellWithReuseIdentifier: "myID")

        // Configura o layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        let width = (view.frame.size.width - 4) / 3
        layout.itemSize = CGSize(width: width, height: width)
        CommuinityCollectionView.collectionViewLayout = layout
    }
}
