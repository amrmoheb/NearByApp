//
//  Interactor.swift
//  NearByApp
//
//  Created by developer on 10/07/2020.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
class NearByPlacesInteractor {
var networkManger = NetworkLayer()
  typealias CompletionHandler = (Any,Bool) -> Void
     typealias ImageCompletionHandler = (Data?,Bool) -> Void
    func GetNearByPlaces( Lat : String ,Lang : String , completionHandler: @escaping  CompletionHandler){
          networkManger.Request(ResponseModel: NearByPlacesResponseModel.self, RequestConfiq: NetworkRouter.GetNearByPlaces(Lat , Lang), completionHandler:   {
                                respose,IsOnline in
                          // print("Success")
                     completionHandler(respose,IsOnline)
                        })
      }
    func GetMarkPhoto( MarkID : String  , completionHandler: @escaping  CompletionHandler){
        networkManger.Request(ResponseModel: MarkPhotosResponseModel.self, RequestConfiq: NetworkRouter.GetMarkPhoto(MarkID), completionHandler:   {
                                respose,IsOnline in
                         //  print("Success")
                     completionHandler(respose,IsOnline)
                        })
      }
    
    func DownLoadImage( ImageURL : String  , completionHandler: @escaping  ImageCompletionHandler){
        networkManger.DownLoadImage(ImageURL: ImageURL, imagecompletionHandler:   {
                                respose,IsOnline in
                          // print("Success")
                     completionHandler(respose,IsOnline)
                        })
      }
    func SaveModeSwitchValue(value : String)  {
         UserDefaults.standard.set(value, forKey: "ModeSwitch")
    }
    func GetModeSwitchValue() -> String  {
        return UserDefaults.standard.string(forKey: "ModeSwitch") ?? ""
      }
   
    
}
