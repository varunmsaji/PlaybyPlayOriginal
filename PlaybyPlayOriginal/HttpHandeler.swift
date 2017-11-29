  //
//  HttpHandeler.swift
//  PlaybyPlayOriginal
//
//  Created by Varun M S on 29/10/17.
//  Copyright © 2017 Tectra. All rights reserved.
//

import Foundation
class HttpHandler
{
    static func getdatafromurl(url:String,completionHandler:@escaping (Data)->(Void))
    {
        let urlstring = URL(string:url)
        let urlsession = URLSession.shared.dataTask(with: urlstring!) { (data, response, error) in
            
            if error != nil
            {
                print(error)
            }
            else
            {
                if let data = data
                {
                    completionHandler(data as Data)
                }
            }
            
            
        }
        urlsession.resume()
    }
}
