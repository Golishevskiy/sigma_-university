//
//  String+LimitChar.swift
//  HM18
//
//  Created by Petro Golishevskiy on 24.05.2021.
//

import Foundation

extension String {
    func maxLength(length: Int) -> String {
        var str = self
        let newStr = str as NSString
        if newStr.length >= length {
            str = newStr.substring(with: NSRange(location: 0,
                                                 length: newStr.length > length ? length : newStr.length)
            )
        }
        return  str
    }
}
