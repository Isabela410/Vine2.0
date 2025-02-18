//
//  FeedUserView.swift
//  Teste-SWIFT
//
//  Created by izabour Azevedo on 11/02/25.
//

import Foundation
import UIKit
class FeedUserView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var userFeed: UICollectionView!
    override func viewDidLoad() {
           super.viewDidLoad()
           userFeed.delegate = self
           userFeed.dataSource = self


           let cellNib = UINib(nibName: "FeedUserViewCell", bundle: nil)
           userFeed.register(cellNib, forCellWithReuseIdentifier: "myID")

           setupCollectionViewLayout()
       }
       private func setupCollectionViewLayout() {
           let layout = UICollectionViewFlowLayout()
           layout.minimumInteritemSpacing = 0
           layout.minimumLineSpacing = 0
           layout.scrollDirection = .vertical

         
           let width = view.frame.size.width
           let height = view.frame.size.height
           layout.itemSize = CGSize(width: width, height: height)

        
           userFeed.collectionViewLayout = layout
           userFeed.isPagingEnabled = true
           userFeed.showsVerticalScrollIndicator = false
       }

       // MARK: - UICollectionViewDataSource

       func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }

       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 3
       }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myID", for: indexPath) as! FeedUserViewCell

           
           cell.cameraButton.isHidden = true
           cell.userImage.image = UIImage(named: "vine 1") 
           cell.userName.text = "izabour"
           cell.descriptionVideo.text = "teste"
           cell.shareButton.setTitleColor(.systemBlue, for: .normal)
           cell.verComunidade.setTitleColor(.systemBlue, for: .normal)
           cell.hastagVideo.text = "#teste"
           cell.likeButton.setTitleColor(.systemBlue, for: .normal)

           return cell
       }
   }
