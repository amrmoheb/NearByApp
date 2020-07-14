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
  
    @IBOutlet weak var NearByList: UITableView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = NearByPlacesPresenter(View: self)
        
        presenter.UpdateMode()
        StartLocationMonitoring()

    }
    
    
    @IBAction func ModeBtnClicked(_ sender: Any) {
         presenter.ModeBtnClicked()
    }
    
   

}
