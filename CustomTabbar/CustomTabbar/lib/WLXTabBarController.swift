//
//  WLXViewController.swift
//  CustomTabbar
//
//  Created by 王丽霞 on 2019/4/24.
//  Copyright © 2019年 王丽霞. All rights reserved.
//

import UIKit

class WLXTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
    }
    
    fileprivate func createUI(){
        let first = FirstViewController()
        self.addChild(with: first, title: "首页", imageName: "first", selectedImageName: "first_selected")
        let mine = ThirdViewController()
        self.addChild(with: mine, title: "我的", imageName: "mine", selectedImageName: "mine_selected")
        let tabbar = UITabBar.appearance()
        tabbar.backgroundImage = UIColor.white.toImage()
        tabbar.shadowImage = UIImage()
        self.setCustomtabbar()
        
    }
    fileprivate func setCustomtabbar(){
        let tabbar = CustomTabbar()
        self.setValue(tabbar, forKey: "tabBar")
        tabbar.centerButton.addTarget(self, action:#selector(centerButtonClickAction), for: .touchUpInside)
    }
    
    @objc func centerButtonClickAction(){
        print("中间的被点了")
    }
    fileprivate func addChild(with childController:UIViewController, title:NSString, imageName:NSString ,selectedImageName:NSString){
        childController.title = title as String
        childController.tabBarItem.image = UIImage(named: imageName as String)!.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName as String)!.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.darkGray], for: .selected)
        let nav = UINavigationController(rootViewController: childController)
        self.addChild(nav)
        
    }
    
}
extension UIColor{
    func toImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        self.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
