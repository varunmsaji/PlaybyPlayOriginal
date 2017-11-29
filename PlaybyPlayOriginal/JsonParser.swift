//
//  JsonParser.swift
//  PlaybyPlayOriginal
//
//  Created by Varun M S on 29/10/17.
//  Copyright © 2017 Tectra. All rights reserved.
//

import Foundation
class JsonParser
{
    static func getjson(data:Data)->[String:Any]?
    {
        do
        {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            return json
        }catch{
            print(error)
        }
        return nil
    }
}
