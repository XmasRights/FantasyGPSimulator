//
//  PlistLoader.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 29/04/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

enum PlistLoaderError: Error
{
    case invalidURL
    case noData
    case couldNotDecode
}

struct PlistLoader
{
    static func load<T: Decodable>(resource: String, subdirectory: String) throws -> T
    {
        guard let url = Bundle.main.url(forResource: resource, withExtension: "plist", subdirectory: subdirectory)
            else { throw PlistLoaderError.invalidURL }
        
        guard let data = try? Data(contentsOf: url)
            else { throw PlistLoaderError.noData }
        
        let decoder = PropertyListDecoder()
        
        do {
            let decoded = try decoder.decode(T.self, from: data)
            return decoded
        }
        catch {
            throw error
        }
    }
}
