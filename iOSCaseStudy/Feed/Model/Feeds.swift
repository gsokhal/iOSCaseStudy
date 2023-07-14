//
//  Feed.swift
//  iOSCaseStudy
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import Foundation

struct Feeds {

    struct Request: Codable {
    }

    struct Response: Codable {
        let status: String
        let results: [FeedData]?
    }
}

struct FeedData: Codable {
    let title: String?
    let media: [Media]?
}

struct Media: Codable {
    let type: String
    let mediaMetadata: [MediaMetaData]?

    enum CodingKeys: String, CodingKey {
        case type
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetaData: Codable {
    let url: String?
}
