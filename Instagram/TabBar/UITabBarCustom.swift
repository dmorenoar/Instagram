//
//  UITabBarCustom.swift
//  Instagram
//
//  Created by dmorenoar on 27/12/18.
//  Copyright © 2018 dmorenoar. All rights reserved.
//

import UIKit

class UITabBarCustom: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //8F9294 color not selected
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.darkGray], for: .normal)
        
        tabBarItem = self.tabBar.items?[0]
        tabBarItem.image = UIImage(named: "homeWhite")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage = UIImage(named: "homeBlack")?.withRenderingMode(.alwaysOriginal)
        
        tabBarItem = self.tabBar.items?[1]
        tabBarItem.image = UIImage(named: "likedWhite")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage = UIImage(named: "likedBlack")?.withRenderingMode(.alwaysOriginal)
        
        
        tabBarItem = self.tabBar.items?[2]
        tabBarItem.image = UIImage(named: "shareWhite")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage = UIImage(named: "shareBlack")?.withRenderingMode(.alwaysOriginal)
        
        tabBarItem = self.tabBar.items?[3]
        tabBarItem.image = UIImage(named: "friendsWhite")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage = UIImage(named: "friendsBlack")?.withRenderingMode(.alwaysOriginal)
        
        tabBarItem = self.tabBar.items?[4]
        tabBarItem.image = UIImage(named: "profileWhite")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage = UIImage(named: "profileBlack")?.withRenderingMode(.alwaysOriginal)
        
        
        for index in 0...tabBar.items!.count - 1{
            tabBarItem = self.tabBar.items?[index]
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
        self.selectedIndex = 0
        
    }


}
