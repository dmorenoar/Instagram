//
//  User.swift
//  Instagram
//
//  Created by dmorenoar on 27/12/18.
//  Copyright © 2018 dmorenoar. All rights reserved.
//

import Foundation
import UIKit

class User: Codable {
    var userName:String
    var userNickName:String
    var userState:String
    var userImage:String
    var userDesc:String
    var userFollowing:[User] = [User]()
    var userPost:[Post] = [Post]()
    
    init(userName:String, userNickName:String, userState:String, userImage:String, userDesc:String, userFollowing:[User]) {
        self.userName = userName
        self.userNickName = userNickName
        self.userState = userState
        self.userImage = userImage
        self.userDesc = userDesc
        self.userFollowing = userFollowing
    }

}
