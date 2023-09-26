//
//  UIDevice+Extension.swift
//  Converter
//
//  Created by Mariya Pankova on 18.08.2023.
//

import UIKit

extension UIDevice {
    static var isIpad: Bool {
        current.userInterfaceIdiom == .pad
    }
}
