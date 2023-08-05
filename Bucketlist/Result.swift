//
//  Result.swift
//  Bucketlist
//
//  Created by Kirill Streltsov on 05.08.23.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    var desription: String {
        if let descriptionText = terms?["description"]?.first {
            return descriptionText
        } else {
            return "No further operation"
        }
    }
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title 
    }
}
