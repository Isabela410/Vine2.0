//
//  UploadView.swift
//  Teste-SWIFT
//
//  Created by izabour Azevedo on 11/02/25.
//


import UIKit

class UploadView : UIViewController {
    
    var videoURL: URL?
    
    
    @IBOutlet var videoRecorded: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var feedButton: UIButton!
    @IBOutlet weak var comunityButton: UIButton!
    @IBOutlet weak var volumeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

#Preview{
    UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "UploadView")
}
