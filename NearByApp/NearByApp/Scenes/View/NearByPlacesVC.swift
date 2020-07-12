//
//  NearByPlacesVC.swift
//  NearByApp
//
//  Created by developer on 10/07/2020.
//  Copyright © 2020 developer. All rights reserved.
//

import UIKit
import CoreLocation

class NearByPlacesVC: UIViewController {
var presenter : NearByPlacesPresenter!
    
    @IBOutlet weak var CurrentModeLabel: UILabel!
    @IBOutlet weak var ModeBtn: UIBarButtonItem!
    @IBOutlet weak var DebugText: UITextView!
    @IBOutlet weak var NearByList: UITableView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = NearByPlacesPresenter(View: self)
       
        StartLocationMonitoring()
      
        
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func ModeBtnClicked(_ sender: Any) {
         presenter.ModeBtnClicked()
    }
    
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
