//
//  FeedEndpoint.swift
//  iOSCaseStudy
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import Foundation

enum FeedEndpoint {
    case mostEmailed
    case mostShared
    case mostViewed
}

extension FeedEndpoint: Endpoint {
    var path: String {
        switch self {
        case .mostEmailed:
            return "/svc/mostpopular/v2/emailed/7.json"
        case .mostShared:
            return "/svc/mostpopular/v2/shared/1/facebook.json"
        case .mostViewed:
            return "/svc/mostpopular/v2/viewed/1.json"
        }
    }

    var method: RequestMethod {
        switch self {
        case .mostEmailed, .mostShared, .mostViewed:
            return .get
        }
    }

    var body: [String: String]? {
        switch self {
        case .mostEmailed, .mostShared, .mostViewed:
            return nil
        }
    }
}
