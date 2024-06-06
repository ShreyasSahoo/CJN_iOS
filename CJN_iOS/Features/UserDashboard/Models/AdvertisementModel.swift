//
//  AdvertisementModel.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 05/06/24.
//

import Foundation

struct Advertisement : Decodable {
    let advertisementID : Int
    let employerID : String
    let advertisementName : String
    let advertisementAsset : String
    let createdAt : String
    let updatedAt : String
    
    enum CodingKeys: String, CodingKey{
        case advertisementID = "advertisement_id"
        case employerID = "emaployer_id"
        case advertisementName = "advertizment_name"
        case advertisementAsset = "advertisement_asset"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
