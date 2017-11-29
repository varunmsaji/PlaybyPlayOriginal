//
//  MovieModel.swift
//  PlaybyPlayOriginal
//
//  Created by Varun M S on 28/10/17.
//  Copyright © 2017 Tectra. All rights reserved.
//

import Foundation
class MovieModel
{
    var name:String?
    var year:String?
    var imageurl:String
  
    init(name:String,year:String,imagurl:String)
    {
        self.name = name
        self.year = year
        self.imageurl = imagurl
     
        
    }
}
