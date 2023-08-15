//
//  ColorExtinction.swift
//  SA-CountryPicker
//
//  Created by Sara Mady on 10/06/2023.
//
import Foundation
import SwiftUI

enum AssetsColor: String {
    case BackGroundColor
    case MainColor
    case FontColor
    case GreenColor
    case TitleColor
}

extension Color {
    
    static func appColor(_ name: AssetsColor) -> Color? {
        return Color(name.rawValue)
    }
    
    init(hexString: String, alpha: CGFloat = 1.0) {
        var hexInt: UInt64 = 0
        let scanner = Scanner(string: hexString)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanInt64(&hexInt)
        
        let red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexInt & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexInt & 0xff) >> 0) / 255.0
        let alpha = alpha
       
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
