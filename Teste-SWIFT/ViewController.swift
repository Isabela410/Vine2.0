//
//  ViewController.swift
//  Teste-SWIFT
//
//  Created by izabour Azevedo on 04/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var passwordEmpty: UITextField!
    @IBOutlet weak var closeOpen: UIButton!
    @IBAction func buttonEye(_ sender: Any) {
        passwordEmpty.isSecureTextEntry.toggle()
        _ = passwordEmpty.isSecureTextEntry ? "eye.slash" : "eye.fill"
    }
@objc func buttonCloseOpen(_ sender: Any) {
            
    }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
    }
//
