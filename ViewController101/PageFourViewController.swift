//
//  PageFourViewController.swift
//  ViewController101
//
//  Created by AphiwitSCB on 13/7/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit
import FMDB

class PageFourViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mTableView: UITableView!
    var mDatabase: FMDatabase!
    var mDataArray:[[String: Any]] = []
    let mFlightDummyArray:[String] =
        ["07:00     TG102       BKK     A33",
         "16:30     BE731       LON     B01",
         "09:45     FR122       FRA     D23",
         "19:30     AA911       AME     F53",
         "01:20     CN099       CHA     G22",
         "12:10     TG233       DEN     A23",
         "17:40     KR122       LDN     J32",
         "13:30     JP291       JAN     C04",
         "20:20     KR001       KOR     D09",
         "21:10     LU022       SPN     E22",
         "22:40     TG110       URN     A18"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.openDB()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flightCell") as? FlightTableViewCell
        
        if indexPath.row % 2 == 0 {
            cell?.mIcon.image = UIImage(named: "landing_icon.png")
        }else {
            cell?.mIcon.image = UIImage(named: "takeoff_icon.png")
        }
        
        return cell!
    }
    
    func openDB() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/data.sqlite" //want root = [0]
        let fileMgr = FileManager()
        do {
            if (!fileMgr.fileExists(atPath: path)) {
                //no db file - copy is required
                let orgPath = Bundle.main.path(forResource: "data.sqlite", ofType: nil)
                //            try fileMgr.copyItem(atPath: orgPath!, toPath: path)
                try fileMgr.copyItem(atPath: orgPath!, toPath: path)
            }
            
            //openDB
            self.mDatabase = FMDatabase(path: path)
            self.mDatabase.open()
        }catch{
            print(error.localizedDescription)
        }
        print(path)
    }
    
    func query(){
        self.mDataArray.removeAll()
        if let rs = self.mDatabase.executeQuery("SELECT ROW, FIELD_DATA FROM FIELDS ORDER BY ROW DESC", withArgumentsIn: []){
            while rs.next() {
                let colID = rs.int(forColumn: "ROW")
                let colData = rs.string(forColumn: "FIELD_DATA")!
                
                let item:[String:Any] = ["id":colID, "data": colData]
                self.mDataArray.append(item)
                self.mTableView.reloadData()
            }
        }
    }
    
    
    
}
