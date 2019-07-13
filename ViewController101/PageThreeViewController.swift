//
//  PageThreeViewController.swift
//  ViewController101
//
//  Created by AphiwitSCB on 13/7/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import Alamofire
import AlamofireImage
import UIKit

class PageThreeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var mTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
     
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell") as! CustomTableViewCell
        
        return cell
    }
    
    
   
    

   

}
