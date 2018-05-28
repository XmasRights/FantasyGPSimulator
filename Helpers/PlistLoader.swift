//
//  PlistLoader.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 26/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
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
    static func load<T: Decodable>(path: String) throws -> T
    {
        let url = URL.init(fileURLWithPath: path)
        
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
