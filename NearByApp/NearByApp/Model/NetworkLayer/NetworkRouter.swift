//
//  File.swift
//  MREC
//
//  Created by developer on 06/05/2020.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation

enum NetworkRouter
{  static let baseURLString = "https://api.foursquare.com/v2/"
 
    static let ClientID = "&client_id=VSKH0W5QMHOPEKGVE1I3FNLFGONLER05VL0QLXRIIWGWTZFP"
    static let ClientSecret = "&client_secret=MOGEMCUIANZBNSGRPXWBBHCYFUDUYKGZ1ZRECSL3FV0HMK54"
    static let APIVersion = "&v=20200710"
    
    case GetNearByPlaces(String , String)
     case GetMarkPhoto(String)
    

    func GetUrl() -> String {
  
        var relativePath = ""
        
        switch self {
        case .GetNearByPlaces(let lat , let lang):
            relativePath = "venues/explore?ll=" + String(lat) + "," + String(lang)
        case .GetMarkPhoto(let MarkID):
            relativePath = "venues/" + String(MarkID) + "/photos?"
       
        }
      
        return NetworkRouter.baseURLString + relativePath +  NetworkRouter.ClientID + NetworkRouter.ClientSecret + NetworkRouter.APIVersion
    }
    
    func GetMethod() -> String {
        switch self {
       
        case .GetNearByPlaces,.GetMarkPhoto :
             return "Get"
       
        }
    }

  
    
}
