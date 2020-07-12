//
//  NearByPlaces+LocationService.swift
//  NearByApp
//
//  Created by developer on 12/07/2020.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import CoreLocation

extension NearByPlacesVC : CLLocationManagerDelegate
{
    func startMySignificantLocationChanges() {
           if !CLLocationManager.significantLocationChangeMonitoringAvailable() {
               // The device does not support this service.
               return
           }
           locationManager.delegate = self
               locationManager.requestWhenInUseAuthorization()
           locationManager.startMonitoringSignificantLocationChanges()
           
       }
       func locationManager(_ manager: CLLocationManager,  didUpdateLocations locations: [CLLocation]) {
          let lastLocation = locations.last!
           print(lastLocation.coordinate.latitude)
           DebugText.text +=  "   " + String( lastLocation.coordinate.latitude) + "," + String( lastLocation.coordinate.longitude)
           presenter.GetNearByPlaces(Lat: String( lastLocation.coordinate.latitude), Lang: String(
               lastLocation.coordinate.longitude))
            presenter.UpdateMode()
         
          // Do something with the location.
       }
       func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
          if let error = error as? CLError, error.code == .denied {
             // Location updates are not authorized.
             manager.stopMonitoringSignificantLocationChanges()
             return
          }
          // Notify the user of any errors.
       }
}
