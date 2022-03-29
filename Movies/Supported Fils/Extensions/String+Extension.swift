//
//  String+Extension.swift
//  Movies
//
//  Created by Hesham Aly on 29/03/2022.
//


import UIKit


extension String {
    
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    var timestamp: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC") ?? TimeZone.current

        return dateFormatter.date(from: self) ?? Date()
    }
   
}
