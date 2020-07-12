//
//  NearByPlaceVC+TabelView.swift
//  NearByApp
//
//  Created by developer on 10/07/2020.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import UIKit
extension NearByPlacesVC : UITableViewDataSource , UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.GetNearByPlacesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "MarkCell") as! NearByPlaceCell
        cell.SetName(Name: presenter.GetMarkName(index: indexPath.row))
        cell.SetAdress(Adress: presenter.GetMarkAdress(index: indexPath.row))
        cell.SetImage(Photo: presenter.GetMarkPhoto(index: indexPath.row))
        return cell
    }
    
    
}
