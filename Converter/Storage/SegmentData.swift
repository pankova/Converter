//
//  SegmentData.swift
//  Converter
//
//  Created by Mariya Pankova on 03.10.2023.
//

import Foundation

struct SegmentData: Codable {
    let value: String
    let initial: [Int]
    let goal: [Int]
}
