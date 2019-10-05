//
//  API.swift
//  My Cheques
//
//  Created by Apple on 10/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API: NSObject {
    
    class func regPost (name:String ,mobileNo:String, password:String, completion: @escaping (_ error: Error?, _ success: Bool,
        _ isSuccessfuly: Bool)-> Void ){
        
        let serverURI =  "http://192.168.1.106:9091/api/signUp"
        Alamofire.request(serverURI, method: .post, parameters: ["user_name": name,"user_phone": mobileNo, "user_password":password], encoding: URLEncoding.default , headers: nil)
            .validate(statusCode: 200..<300)
            
            //            from swftyjson
            
            .responseJSON { response in
                
                switch response.result{
                    
                case .failure(let error):
                    completion(error, false, false)
                    print(error)
                    
                case .success(let value):
                    let json = JSON(value)
                    let isSuccess = json ["success"]

                    if let api_token = json["token"].string{
                        completion (nil, true,isSuccess.boolValue)
//                        save token to userDefults
                         
                        let def = UserDefaults.standard
                        def.setValue(api_token, forKey: "token")
                        def.synchronize()
                        

                    }else {
                        
                        //                            there is a connection but not true info
                        completion (nil, true, isSuccess.boolValue)
                        
                    }
                    
                }
                
        }
        
}
    
 
    
    class func loginPost (mobileNo:String, password:String, completion: @escaping (_ error: Error?, _ success: Bool,
        _ isSuccessfuly: Bool)-> Void ){
            
            let serverURI =  "http://192.168.1.106:9091/api/auth"
            Alamofire.request(serverURI, method: .post, parameters: ["user_phone": mobileNo, "user_password":password], encoding: URLEncoding.default , headers: nil)
                .validate(statusCode: 200..<300)
                
                //            from swftyjson
                
                .responseJSON { response in
                    
                    switch response.result{
                        
                    case .failure(let error):
                        completion(error, false,false)
                        print(error)
                        
                    case .success(let value):
                        print(value)
                        let json = JSON(value)
                        let isSuccess = json ["success"]
//

                        if let api_token = json["token"].string{
                            completion (nil, true, isSuccess.boolValue)
                            print(api_token)
    //                        save token to userDefults
                            let def = UserDefaults.standard
                            def.setValue(api_token, forKey: "token")
                            def.synchronize()
                            

                        }else{
//                            there is a connection but not true info
                            completion (nil, true, isSuccess.boolValue)
                            
                        }
                        
                    }
                    
            }
            
    }
}
