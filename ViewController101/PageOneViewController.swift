//
//  PageOneViewController.swift
//  ViewController101
//
//  Created by AphiwitSCB on 13/7/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit
import WebKit


class PageOneViewController: UIViewController, WKNavigationDelegate{

    @IBOutlet weak var mWebView:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.openWebView()
    }
    
    @IBAction func onSegmentChanged(sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.openWebView()
            break
        default:
            self.openPDF()
            break
        }
    }
    
    func openWebView() {
        print("webview")
        let url = URL(string: "https://www.uplabs.com")
        let request = URLRequest(url: url!)
        mWebView.load(request)
    }
    
    func openPDF() {
        print("open PDF Successful")
        let path = Bundle.main.path(forResource: "resume", ofType: "pdf")
        print("path", path)
        let urlPath = URL(fileURLWithPath: path!)
        let request = URLRequest(url: urlPath)
        mWebView.load(request)
    }
    
   

}
