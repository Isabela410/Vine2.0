//
//  UploadView.swift
//  Teste-SWIFT
//
//  Created by izabour Azevedo on 11/02/25.
//


import UIKit

class UploadView : UIViewController {
    
    @IBOutlet weak var excluirVideo: UIButton!
    @IBOutlet weak var videoSound: UIButton!
    @IBOutlet weak var addComunidade: UIButton!
    @IBOutlet weak var addFeed: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var videoView: UIView!
    @IBAction func deleteVideo(_ sender: Any) {
    }
    @IBAction func seuFeed(_ sender: Any) {
    }
    @IBAction func suasComunidades(_ sender: Any) {
    }
    @IBAction func onOffSound(_ sender: Any) {
    }
}
