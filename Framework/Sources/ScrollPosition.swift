//
//  ScrollPosition.swift
//  SpreadsheetView
//
//  Created by Kishikawa Katsumi on 4/23/17.
//  Copyright © 2017 Kishikawa Katsumi. All rights reserved.
//

import Foundation

public struct ScrollPosition: OptionSet, Sendable {
    // The vertical positions are mutually exclusive to each other, but are bitwise or-able with the horizontal scroll positions.
    // Combining positions from the same grouping (horizontal or vertical) will result in an NSInvalidArgumentException.
    public static let top = ScrollPosition(rawValue: 1 << 0)
    public static let centeredVertically = ScrollPosition(rawValue: 1 << 1)
    public static let bottom = ScrollPosition(rawValue: 1 << 2)

    // Likewise, the horizontal positions are mutually exclusive to each other.
    public static let left = ScrollPosition(rawValue: 1 << 3)
    public static let centeredHorizontally = ScrollPosition(rawValue: 1 << 4)
    public static let right = ScrollPosition(rawValue: 1 << 5)

    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

extension ScrollPosition: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var options = [String]()
        if contains(.top) {
            options.append(".top")
        }
        if contains(.centeredVertically) {
            options.append(".centeredVertically")
        }
        if contains(.bottom) {
            options.append(".bottom")
        }
        if contains(.left) {
            options.append(".left")
        }
        if contains(.centeredHorizontally) {
            options.append(".centeredHorizontally")
        }
        if contains(.right) {
            options.append(".right")
        }
        return options.description
    }

    public var debugDescription: String {
        return description
    }
}
