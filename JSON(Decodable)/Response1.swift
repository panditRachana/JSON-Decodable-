//
//  Response1.swift
//  JSON(Decodable)
//
//  Created by Rachana Pandit on 13/12/22.
//

import Foundation

struct ApiResponse1:Decodable{
    let products:[Product1]
    let total:Int
    let skip:Int
    let limit:Int
}

struct Product1 :Decodable{
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
