//
//  ViewController.swift
//  Teste-SWIFT
//
//  Created by izabour Azevedo on 04/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var VineLogo: UIImageView!
    @IBOutlet weak var EmailUsuario: UITextField!
    @IBOutlet weak var SenhaUsuario: UITextField!
    @IBOutlet weak var VerSenhaBotao: UIButton!
    @IBOutlet weak var EsqueceuSenhaBotao: UIButton!
    @IBOutlet weak var LogInBotao: UIButton!
    
    @IBAction func buttonEye(_ sender: Any) {
        SenhaUsuario.isSecureTextEntry.toggle()
        _ = SenhaUsuario.isSecureTextEntry ? "eye.slash" : "eye.fill"
    }
    
@objc func buttonCloseOpen(_ sender: Any) {
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
    }
//

#Preview{
    UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "LoginViewController")
}
