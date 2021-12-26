//
//  File.swift
//  CyrptoCrazySUI
//
//  Created by Doğanay Şahin on 3.10.2021.
//

import Foundation

struct CryptoCurrenct: Decodable, Identifiable{
    let id = UUID()
    let price : String
    let currency : String
    
    private enum CodingKeys : String, CodingKey{
        case price = "price"
        case currency = "currency"
        
        
    }
}

