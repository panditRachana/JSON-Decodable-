//
//  ApiResponse2.swift
//  JSON(Decodable)
//
//  Created by Rachana Pandit on 14/12/22.
//

import Foundation

struct ApiResponse2:Decodable{
    let products:[Product2]
    let total:Int
    let skip:Int
    let limit:Int
    
    enum RootKeys: String, CodingKey{
        case products
        case total
        case skip
        case limit
    }
    init(from decoder: Decoder) throws {
        
        let rootContainer = try decoder.container(keyedBy: RootKeys.self)
        self.products = try rootContainer.decode([Product2].self, forKey: .products)
        self.total = try rootContainer.decode(Int.self, forKey: .total)
        self.skip = try rootContainer.decode(Int.self,forKey: .skip)
        self.limit = try rootContainer.decode(Int.self, forKey: .limit)
    }
}

struct Product2 :Decodable{
    let id:Int
    let title:String
    let description:String
    let price:Int
    let discountPercentage:Double
    let rating:Double
    let stock:Int
    let brand:String
    let category:String
    let thumbnail:URL
    let images:[String]
}


