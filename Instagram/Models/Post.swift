//
//  Post.swift
//  Instagram
//
//  Created by dmorenoar on 29/12/18.
//  Copyright © 2018 dmorenoar. All rights reserved.
//

import Foundation


class Post: Codable {
    var namPlace:String
    var cityPlace:String
    var latPlace:String
    var longPlace:String
    var imgPost:String
    var descPost:String
    var peopleLiked:Int
    
    init(namPlace:String, cityPlace:String, latPlace:String, longPlace:String, imgPost:String, descPost:String, peopleLiked:Int) {
        self.namPlace = namPlace
        self.cityPlace = cityPlace
        self.latPlace = latPlace
        self.longPlace = longPlace
        self.imgPost = imgPost
        self.descPost = descPost
        self.peopleLiked = peopleLiked
    }

}
