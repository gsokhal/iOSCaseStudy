//
//  DataLoader.swift
//  iOSCaseStudyTests
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import Foundation

protocol DataLoader: AnyObject {
    var bundle: Bundle { get }
    func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T
    func loadJSON<T: Decodable>(jsonStr: String, type: T.Type) -> T
}

extension DataLoader {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }

    // Loading json from file and returning model
    func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to load JSON")
        }

        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode(type, from: data)

            return decodedObject
        } catch {
            fatalError("Failed to decode loaded JSON")
        }
    }

    // Returning model from Json string paramter
    func loadJSON<T: Decodable>(jsonStr: String, type: T.Type) -> T {
        do {
            let data = Data(jsonStr.utf8)
            let decodedObject = try JSONDecoder().decode(type, from: data)

            return decodedObject
        } catch {
            fatalError("Failed to decode loaded JSON")
        }
    }
}
