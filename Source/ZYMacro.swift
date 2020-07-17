//
//  ZYMarcro.swift
//  ZYKit
//
//  Created by zhangyang on 2020/6/11.
//  Copyright © 2020 zhangyang. All rights reserved.
//

import UIKit

public class ZYMacro: NSObject {

    let SCREEN_WIDTH  :CGFloat  = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT :CGFloat  = UIScreen.main.bounds.size.height
    
    let kScal = (UIScreen.main.bounds.size.width/375)
    
    //设置字体大小
    func kFont(_ x:CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: x * kScal)
    }

    //根据比例调整字体大小
    func kSFont(_ x:CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: x * kScal)
    }

    func kNFont(_ x:CGFloat) -> UIFont {
        return UIFont(name: "DINAlternate-Bold", size: x)!
    }


    func RGBA(_ r:CGFloat ,_ g:CGFloat, _ b:CGFloat,_ a:CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }

    //延时执行
    public func delay(by delayTime: TimeInterval, qosClass: DispatchQoS.QoSClass? = nil,
                      _ closure: @escaping () -> Void) {
        let dispatchQueue = qosClass != nil ? DispatchQueue.global(qos: qosClass!) : .main
        dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delayTime, execute: closure)
    }
    
    public class func iPhone() -> Bool{
        return UIDevice.current.userInterfaceIdiom == .phone ? true : false;
    }

    public class func iPhoneX() -> Bool{
        let window : UIWindow = ((UIApplication.shared.delegate?.window)!)!;
           if #available(iOS 11.0, *) {
               let inset : UIEdgeInsets = window.safeAreaInsets
            if (inset.bottom == 34 || inset.bottom == 21) && ZYMacro.iPhone() {
                   return true;
               }else{
                   return false
               }
           } else {
              return false;
           };
    }
    
    public class func Status_Bar() ->CGFloat{
          return (ZYMacro.iPhoneX() ? 44: 20);
      }
      public class func Navi_Bar() ->CGFloat{
          return (ZYMacro.iPhoneX() ? 88: 64);
      }
      public class func Tab_Bar() ->CGFloat{
          return (ZYMacro.iPhoneX() ? 34: 0);
      }
    
    
}
