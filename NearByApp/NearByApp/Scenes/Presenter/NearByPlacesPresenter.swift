//
//  Presenter.swift
//  NearByApp
//
//  Created by developer on 10/07/2020.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
protocol  NearByPlacesView : class  {
    func ReloadNearByList()
    func ShowLoader()
    func ShowAlert(Message: String)
    func DismissLoader()
    func UpdateModebtnTitle(value :String)
    func UpdateCurrwntModeLabel(value :String)
    func StartLocationMonitoring()
    func StopLocationMonitoring()
}
class NearByPlacesPresenter {
    
    private weak var View : NearByPlacesView?
    private  var Interactor = NearByPlacesInteractor()
    var NearByPlaces = NearByPlacesResponseModel()
    var NearByPlacesPhotosData = MarkPhotosResponseModel()
    var PhotosList = [Data]()
    var NearByPlacesCount = 0
    var CurrentMode = "RealTime"
    var IsRealTime = true
    var IsFirstRequest = true
    init(View : NearByPlacesView)
    {
         self.View = View
    }
    // Get the nearst places
    func GetNearByPlaces(Lat : String , Lang: String) {
        if(IsFirstRequest)
        {
        View?.ShowLoader()
        IsFirstRequest = false
        }
        Interactor.GetNearByPlaces(Lat: Lat, Lang: Lang,  completionHandler: {
               respose,IsOnline in
     
               if(!IsOnline)
               {
                self.View?.ShowAlert(Message: "Something went Wrong !! ")
                   return
               }
               self.NearByPlaces = respose as! NearByPlacesResponseModel
            if let results = self.NearByPlaces.response?.groups?[0].items
            {
            self.NearByPlacesCount = results.count
                // start downloading list with first mark
                if ( self.NearByPlacesCount == 0)
                {
                    self.View?.ShowAlert(Message: "No data Found !! ")
                    return
                }
                if let MarkItemID = results[0].venue?.id
                                   {
                                       self.PhotosList = [Data]()
                                       self.GetMarkImage(MarkID : String(MarkItemID))
                                   }
            }else
            {
                self.View?.ShowAlert(Message: "No data Found !! ")
            }
                       
           })
       }
    // Get the mark image by ID
    func GetMarkImage(MarkID : String) {
         var PhotoURL = ""
         Interactor.GetMarkPhoto(MarkID: MarkID,  completionHandler: {
                respose,IsOnline in

                if(!IsOnline)
                {

                    return
                }
                self.NearByPlacesPhotosData = respose as! MarkPhotosResponseModel
            
             if let result = self.NearByPlacesPhotosData.response
             {
                 if let photos = result.photos
                 {
                     if let items = photos.items
                     {
                         if (items.count > 0)
                         {
                             guard let prefix = items[0].prefix else
                             {
                                self.AppendDefaultImage()
                                 return
                             }
                              PhotoURL = String(prefix)
                            guard let Width = items[0].width else
                              {
                                 self.AppendDefaultImage()
                                  return
                              }
                               PhotoURL += String(Width)
                             
                                     PhotoURL += "x"
                             
                             guard let height = items[0].height else
                                 {
                                     self.AppendDefaultImage()
                                   return
                                 }
                               PhotoURL  += String(height)
                             guard let suffix = items[0].suffix else
                               {
                                 self.AppendDefaultImage()
                                   return
                               }
                               PhotoURL += String(suffix)
                             self.LoadImage(URl: PhotoURL)
                             print("MarkID = " + String(MarkID) + "    " + PhotoURL)
                         }else
                         {
                              self.AppendDefaultImage()
                        }
                     }
                    
                 }else{
                     self.AppendNOQutaImage()
                 }
             }else{
                self.AppendDefaultImage()
            }
           return
             
             
            })
        }
     
     // Download image
     func LoadImage(URl : String)
     {
         Interactor.DownLoadImage(ImageURL: URl, completionHandler: {
             respose,IsOnline in
     
                           if(!IsOnline){
                        self.AppendDefaultImage()
                             self.GetNextPhoto()
                               return
                           }
       
             if let ImageData = respose
             {
                if(self.PhotosList.count == 0)
                {
                    self.View?.DismissLoader()
                }
                self.PhotosList.append(ImageData)
                 self.View?.ReloadNearByList()
            
             }else
             {
                 self.AppendDefaultImage()
            }
            self.GetNextPhoto()
             
             
         })
     }
    // determine the ID of next photo and load it
    func GetNextPhoto()
    {
        if(self.PhotosList.count < self.NearByPlacesCount)
                       {
                           if let MarkItemID = self.NearByPlaces.response?.groups?[0].items?[self.PhotosList.count].venue?.id
                           {
                               print(self.PhotosList.count)
                                print(self.NearByPlacesCount)
                               self.GetMarkImage(MarkID : String(MarkItemID))
                           }
                          
                       }else
                       {
                           // full table images downloaded
                            self.View?.ReloadNearByList()
                       }
    }
    // add new image to photolist
    func AppendDefaultImage()
    {
        if(PhotosList.count == 0)
        {
            View?.DismissLoader()
        }
        print("DefaultAppended")
        PhotosList.append(UIImage(named: "default-store")?.pngData() ?? Data())
         self.View?.ReloadNearByList()
        self.GetNextPhoto()
        
    }
    // if quata exceeded load NOQuta image
    func AppendNOQutaImage()
    {
        if(PhotosList.count == 0)
        {
            View?.DismissLoader()
        }
          print("DefaultAppended")
          PhotosList.append(UIImage(named: "NoQuta")?.pngData() ?? Data())
         self.View?.ReloadNearByList()
          self.GetNextPhoto()
      }
    // Get the Count of Loaded Places
    func GetNearByPlacesCount() -> Int
    {
        return self.PhotosList.count
    }
    // retern the photo of spasific index
    func GetMarkPhoto(index : Int) -> Data
    {

          return PhotosList[index]
      }
    // get place id of spasific index
    func GetMarkID(index : Int) -> String
    {
        print("index = " + String(index) )
        if let id =  self.NearByPlaces.response?.groups?[0].items?[index].venue?.id
               {
                return String(id)
               }
       
        return ""
    }
    //get the name of place
    func GetMarkName(index : Int) -> String
    {
        if let name =  self.NearByPlaces.response?.groups?[0].items?[index].venue?.name
              {
               return name
              }
        return ""
    }
    // get the address pf place
    func GetMarkAdress(index : Int) -> String
    {
        if let address =  self.NearByPlaces.response?.groups?[0].items?[index].venue?.location?.address
               {
                return address
               }
           return ""
       }
    // update current mode (realtime , single update)
    func UpdateMode()
    {
          let mode = Interactor.GetModeSwitchValue()
              
              if(mode == "" || mode == "RealTime")
              {
                IsRealTime = true
                View?.UpdateModebtnTitle(value: "SingleUpdate")
                View?.UpdateCurrwntModeLabel(value: "RealTime")
                
              }
              else if(mode == "SingleUpdate")
              {
                IsRealTime = false
                  View?.UpdateModebtnTitle(value: "RealTime")
                 View?.UpdateCurrwntModeLabel(value: "SingleUpdate")
                   
              }
        
    }
    // triggered when swich mode btn clicked
    func ModeBtnClicked()
    {
      if(IsRealTime)
      {
        SetOneUpdateMode()
      }
      else
      {
        SetRealTimeMode()
       }
        UpdateMode()
    }
    // save single update mode in memmory
    func SetOneUpdateMode()
    {
        
        Interactor.SaveModeSwitchValue(value: "SingleUpdate")
        IsRealTime = false
        View?.StopLocationMonitoring()
     
    }
    // save realtime mode in memmory
    func SetRealTimeMode()
    {
        
        Interactor.SaveModeSwitchValue(value: "RealTime")
        IsRealTime = true
          View?.StartLocationMonitoring()
      
    }
    func CheckOnMode()
    {
        if(!IsRealTime)
        {
            View?.StopLocationMonitoring()
        }
         
       }

}
