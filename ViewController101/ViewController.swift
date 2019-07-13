//
//  ViewController.swift
//  ViewController101
//
//  Created by AphiwitSCB on 13/7/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit







class ViewController: UITableViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let targetVC = segue.destination
        let selectedIndex = self.tableView.indexPathForSelectedRow
        let selectedCell = self.tableView.cellForRow(at: selectedIndex!)
        targetVC.title = selectedCell?.textLabel?.text
    }
    
    

}

