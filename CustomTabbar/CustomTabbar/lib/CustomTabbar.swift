//
//  CustomTabbar.swift
//  CustomTabbar
//
//  Created by 王丽霞 on 2019/4/24.
//  Copyright © 2019年 王丽霞. All rights reserved.
//

import UIKit

class CustomTabbar: UITabBar {
    
    var centerButton:UIButton!
    
    
    init() {
        super.init(frame: CGRect.zero)
        self.createUI()
    }
    
    
  fileprivate func createUI(){
        centerButton = UIButton(type: .custom)
        centerButton.setImage(UIImage(named: "center_button"), for: .normal)
        centerButton.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
        self.addSubview(centerButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.centerButton.center = CGPoint(x: self.bounds.size.width*0.5, y: self.bounds.size.height*0.3)
        var index:Int = 0
        // 需要几个按钮
        let width = self.bounds.size.width / 3
        for subView in self.subviews {
            if subView.isKind(of: NSClassFromString("UITabBarButton")!){
                subView.frame = CGRect(x: CGFloat(index)*width, y: self.bounds.origin.y, width: width, height: self.bounds.size.height - 2)
                index += 1
                // 这里需要注意一下，对应的数量应该是你需要加大图标位置的下标，比如我这里是需要的是三个中的第二个要加大，下标为1
                if index == 1 {
                    index += 1
                }
            }
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden == false {
            // point 转换到目标试图中，返回在目标试图中的point
            let newPoint:CGPoint = self.convert(point, to: self.centerButton)
            // 判断点击是否在目标控件上
            if self.centerButton.point(inside: newPoint, with: event){
                return self.centerButton;
            }else{
                return super.hitTest(point, with: event)
            }
        }
        return super.hitTest(point, with: event)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
