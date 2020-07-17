//
//  ZYRefresh.swift
//  ZYKitDemo
//
//  Created by zhangyang on 2020/7/16.
//  Copyright © 2020 zhangyang. All rights reserved.
//

import UIKit
import Alamofire

public struct ZYRefreshOption : OptionSet {
    public let rawValue : Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    public static var none          : ZYRefreshOption{return ZYRefreshOption(rawValue: 0)}
    public static var header        : ZYRefreshOption{return ZYRefreshOption(rawValue: 1<<0)}; //将1按照二进制向左移动1位
    public static var footer        : ZYRefreshOption{return ZYRefreshOption(rawValue: 1<<1)};
    public static var autoHeader    : ZYRefreshOption{return ZYRefreshOption(rawValue: 1<<2)};
    public static var autoFooter    : ZYRefreshOption{return ZYRefreshOption(rawValue: 1<<3)};
    public static var defaultHidden : ZYRefreshOption{return ZYRefreshOption(rawValue: 1<<4)};
    public static var defaults      : ZYRefreshOption{return ZYRefreshOption(rawValue: header.rawValue|autoHeader.rawValue|footer.rawValue|defaultHidden.rawValue)};
}

@objc public protocol ZYRefreshDataSource : NSObjectProtocol {
    var refreshFooterData:[UIImage] { get}
    var refreshHeaderData:[UIImage] { get}
    var refreshLoaderData:[UIImage] { get}
    var refreshEmptyData :UIImage   { get}
    var refreshErrorData :UIImage   { get}
    
    @objc optional var refreshLoaderToast : String {get}
    @objc optional var refreshErrorToast  : String {get}
    @objc optional var refreshEmptyToast  : String {get}
}

class ZYRefresh: NSObject {
    //网络是否可用
    class func reachable() -> Bool{
           return NetworkReachabilityManager.init()!.isReachable;
    }
}

extension UIColor {
    convenience init(hex string: String) {
      var hex = string.hasPrefix("#")
        ? String(string.dropFirst())
        : string
      guard hex.count == 3 || hex.count == 6
        else {
          self.init(white: 1.0, alpha: 0.0)
          return
      }
      if hex.count == 3 {
        for (index, char) in hex.enumerated() {
          hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
        }
      }
      guard let intCode = Int(hex, radix: 16) else {
        self.init(white: 1.0, alpha: 0.0)
        return
      }
      self.init(
        red:   CGFloat((intCode >> 16) & 0xFF) / 255.0,
        green: CGFloat((intCode >> 8) & 0xFF) / 255.0,
        blue:  CGFloat((intCode) & 0xFF) / 255.0, alpha: 1.0)
    }
}
