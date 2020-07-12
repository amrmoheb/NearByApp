//
//  NetworkLayer.swift
//  MREC
//
//  Created by developer on 07/05/2020.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import Alamofire
class NetworkLayer {
    
    
       var AnyModel :Any!
    typealias CompletionHandler = (Any,Bool) -> Void
     typealias ImageCompletionHandler = (Data?,Bool) -> Void
    init() {
        
    }
    //swicher
   func Request<T:Decodable>( ResponseModel: T.Type,RequestConfiq: NetworkRouter,completionHandler: @escaping  CompletionHandler)
    {
        switch RequestConfiq.GetMethod() {
       
      case "Get":
             GetRequest(Model: ResponseModel, RequestConfiq: RequestConfiq, completionHandler: completionHandler)
              print("Get Request Proceed")
        default:
            print("No Method setted")
        }
    }
    public  func GetRequest<T:Decodable>( Model: T.Type,RequestConfiq: NetworkRouter,completionHandler: @escaping  CompletionHandler)
      {
        
       var MinValue  = "99"
        let request = AF.request(RequestConfiq.GetUrl())
       // var utf8Text = ""
        
       request.responseJSON
        {
            data  in
           // print(RequestConfiq.GetUrl())
           // print("mydata")
            //print(data)
              //  print(Model)

            switch data.result {
            case .failure(let error):
             // self.NetworkErrorHandle(ErrorMessage :" Check your Internet Connection ")
               completionHandler(self.AnyModel,false)
              return
                // Do your code here...

            case .success(_):
                print( "")
            }
        
            do{
                self.AnyModel =  try  JSONDecoder().decode(Model, from: data.data!)


           }


           catch{
            print("Error In Parsing")
                  }
           
      
         completionHandler(self.AnyModel,true)
      }
     
 
    }
    func DownLoadImage(ImageURL : String ,imagecompletionHandler: @escaping  ImageCompletionHandler) {
        AF.request(ImageURL).responseData { response in

          //   print(response.response)
            switch response.result {
                   case .failure(let error):
                      imagecompletionHandler(response.data,false)
                     return
                       // Do your code here...

                   case .success(_):
                       print("Success" + ImageURL)
                   }
             if let image = response.data {

             imagecompletionHandler(image,true)

            }

        }
    }
  
}
