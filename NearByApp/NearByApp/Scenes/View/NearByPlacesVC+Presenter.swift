//
//  NearByPlacesVC+Presenter.swift
//  NearByApp
//
//  Created by developer on 10/07/2020.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import UIKit
extension  NearByPlacesVC: NearByPlacesView
{
    func ReloadNearByList()
    {
        NearByList.reloadData()
    }
    func ShowAlert(Message :String)
    {
     let alert = UIAlertController(title: "..", message: Message, preferredStyle: UIAlertController.Style.alert)
     alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
     self.present(alert, animated: true, completion: nil)
    }

    
    
    func ShowLoader()
    {
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
   let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    loadingIndicator.hidesWhenStopped = true
                loadingIndicator.style = UIActivityIndicatorView.Style.gray
                loadingIndicator.startAnimating();

                alert.view.addSubview(loadingIndicator)
                present(alert, animated: true, completion: nil)
    }
    func DismissLoader()
    {
 
              self.dismiss(animated: false, completion: nil)
 
    }
    func UpdateModebtnTitle(value :String)  {
        self.ModeBtn.title = value
    }
    func UpdateCurrwntModeLabel(value :String)  {
        self.CurrentModeLabel.text = "Current Mode : " + String(value)
    }
    func StartLocationMonitoring()  {
          startMySignificantLocationChanges()
    }
    func StopLocationMonitoring()  {
         locationManager.stopMonitoringSignificantLocationChanges()
    }

}
