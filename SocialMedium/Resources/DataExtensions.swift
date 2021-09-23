//
//  DataExtensions.swift
//  SocialMedium
//
//  Created by Nathan Wawro on 9/22/21.
//

import Foundation

extension Date {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        formatter.doesRelativeDateFormatting = true
        return formatter
    }()
    
    var formatted: String {
        Self.formatter.string(from: self)
    }
}
