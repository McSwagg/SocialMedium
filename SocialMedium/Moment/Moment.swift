//
//  Moment.swift
//  SocialMedium
//
//  Created by Nathan Wawro on 9/22/21.
//

import Foundation

struct SocialMediumResponse: Codable {
    let items: [Moment]
}

struct Moment: Codable, Hashable, Identifiable {
    let id: String
    let timestamp: Date
    let username: String
    let contents: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case timestamp = "moment-date"
        case username = "moment-poster"
        case contents = "moment-contents"
    }
}
