//
//  Media.swift
//  iOSCaseStudy
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var apiKeyQueryItem: URLQueryItem { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.nytimes.com"
    }

    var header: [String: String]? {
        return [
            "Content-Type": "application/json;charset=utf-8"
        ]
    }

    var apiKeyQueryItem: URLQueryItem {
        return URLQueryItem(name: "api-key", value: "rhhNnk4OGjA3yv60l4oblgAGEqMaIRkw")
    }
}
