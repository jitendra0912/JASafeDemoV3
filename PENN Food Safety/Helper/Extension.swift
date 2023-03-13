//
//  Extension.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 24/09/22.
//

import Foundation
import UIKit
extension String {
    public func getViewController() -> UIViewController? {
        if let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String {
            if let viewControllerType = Bundle.main.classNamed("\(appName).\(self)") as? UIViewController.Type {
                return viewControllerType.init()
            }
        }
        return nil
    }

    func isStringBase64() -> Bool {
            guard Data(base64Encoded: self) != nil else {
                return false
            }
            return true
        }
    
    func matches(for regex: String) -> [String] {
            do {
                let regex = try NSRegularExpression(pattern: regex)
                let results = regex.matches(in: self, range:  NSRange(self.startIndex..., in: self))
                return results.map {
                    //self.substring(with: Range($0.range, in: self)!)
                    String(self[Range($0.range, in: self)!])
                }
            } catch let error {
                print("invalid regex: \(error.localizedDescription)")
                return []
            }
        }
    }
   


extension UINavigationController
{
    /// Given the kind of a (UIViewController subclass),
    /// removes any matching instances from self's
    /// viewControllers array.

    func removeAnyViewControllers(ofKind kind: AnyClass)
    {
        self.viewControllers = self.viewControllers.filter { !$0.isKind(of: kind)}
    }

    /// Given the kind of a (UIViewController subclass),
    /// returns true if self's viewControllers array contains at
    /// least one matching instance.

    func hasViewController(ofKind kind: AnyClass) -> Bool?
    {
        return self.viewControllers.contains(where: { $0.isKind(of: kind) })
    }
}
extension Bundle {
    static func appName() -> String {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ""
        }
        if let version : String = dictionary["CFBundleName"] as? String {
            return version
        } else {
            return ""
        }
    }
}
extension Array {

    func containsObject(_ type: AnyClass) -> (isPresent: Bool, index: Int?) {
        for (index, item) in self.enumerated() {
            if (item as AnyObject).isKind(of: type) {
                return (true, index)
            }
        }
        return (false, nil)
    }
    
    
  
        
        func indexes<T: Equatable>(ofItemsNotEqualTo item: T) -> [Int]?  {
            var result: [Int] = []
            for (n, elem) in self.enumerated(){
                if elem as? T != item {
                    result.append(n)
                }
            }
            return result.isEmpty ? nil : result
        }
    
    
    
}

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    
    func addOrSubtructDay(day:Int)->Date{
      return Calendar.current.date(byAdding: .day, value: day, to: Date())!
    }
    
    func addOrSubtractMonth(month:Int)->Date{
        return Calendar.current.date(byAdding: .month, value: month, to: Date())!
    }

//    func addOrSubtractYear(year:Int)->Date{
//      return Calendar.current.date(byAdding: .year, value: year, to: Date())!
//    }
    
   
}

extension UIImage {

    /*
     @brief decode image base64
     */
    static func decodeBase64(toImage strEncodeData: String!) -> UIImage {

        if let decData = Data(base64Encoded: strEncodeData, options: .ignoreUnknownCharacters), strEncodeData.count > 0 {
            return UIImage(data: decData)!
        }
        return UIImage()
    }
}
extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
