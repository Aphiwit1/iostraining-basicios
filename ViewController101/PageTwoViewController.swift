//
//  PageTwoViewController.swift
//  ViewController101
//
//  Created by AphiwitSCB on 13/7/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit
import QRCode

class PageTwoViewController: UIViewController {

    @IBOutlet weak var mTextField: UITextField!
    @IBOutlet weak var mQRCodeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let qrCode = QRCode("www.google.com")
       mQRCodeImageView.image = qrCode?.image
    }
    
    
    @IBAction func onTextChange(sender: AnyObject){
        print(sender.text!)
//        let textField = sender as! UITextField
//        if let text = textField.text {
//            var qrCode = QRCode(text != "" ? text : "www.google.com")
//            qrCode?.backgroundColor = CIColor(rgba: "000000")
//            self.mQRCodeImageView.image = qrCode?.image
//        }
        
//        let textField =  sender as! UITextField
//        if let text = textField.text {
//            let url = QRCode(text != "" ? text : "www.google.com")!
//            let qrCode = QRCode?(url)
//           self.mQRCodeImageView.image = qrCode?.image
//        }
        
        let textField = sender as! UITextField
        if let text = textField.text {
            let qrCode = QRCode(text != "" ? text : "aphiwit-resume.herokuapp.com")
            self.mQRCodeImageView.image = qrCode?.image
        }
        
    }
    
 

}
