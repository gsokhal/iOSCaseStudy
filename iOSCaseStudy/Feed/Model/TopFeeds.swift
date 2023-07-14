//
//  Feed.swift
//  iOSCaseStudy
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import Foundation

enum TopFeeds {
    case mostEmailed(String, [FeedData])
    case mostShared(String, [FeedData])
    case mostViewed(String, [FeedData])

    var topThreeFeeds: [FeedData] {
        switch self {
        case .mostEmailed(_, let feeds),
             .mostShared(_, let feeds),
             .mostViewed(_, let feeds):

            return Array(feeds.prefix(3))
        }
    }

    var sectionTitle: String {
        switch self {
        case .mostEmailed(let title, _),
             .mostShared(let title, _),
             .mostViewed(let title, _):

            return title
        }
    }
}
