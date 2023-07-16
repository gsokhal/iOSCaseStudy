//
//  Constants.swift
//  iOSCaseStudy
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import Foundation

// MARK: - Common constants
struct Constants {

    /* Localized String constants*/
    static let alertOk = "ok"
    static let cancel = "cancel"
    static let done = "done"
    static let alertTitleInvalid = "invalid"
    static let alertTitleError = "error"
}

// MARK: - Signup Screen
extension Constants {

    static let createNewAccount = "create-new-account"
    static let enterYourName = "enter-your-name"
    static let enterYourEmail = "enter-your-email"
    static let enterYourPassword = "enter-your-password"
    static let signup = "signup"

    // Alert messages
    static let invalidName = "invalid-name"
    static let invalidEmail = "invalid-email"
    static let invalidPassword = "invalid-password"
}

// MARK: - Feed Screen
extension Constants {
    static let feeds = "feeds"
    static let noFeeds = "no-feeds"
    static let errorFectingEmail = "error-fetching-emailed"
    static let errorFetchingShared = "error-fetching-shared"
    static let errorFetchingViewed = "error-fetching-viewed"
    static let sectionEmailedTitle = "section-emailed"
    static let sectionSharedTitle = "section-shared"
    static let sectionViewedTitle = "section-viewed"
}
