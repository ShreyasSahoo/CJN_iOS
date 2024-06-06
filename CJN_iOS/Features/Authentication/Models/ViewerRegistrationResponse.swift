//
//  ViewerRegistrationResponse.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 03/06/24.
//

import Foundation


struct ViewerResponse: Decodable {
    let responseMessage: ViewerResponseMessage
    let responseStatus: Bool
    
    enum CodingKeys: String, CodingKey {
        case responseMessage = "responseMessage"
        case responseStatus = "responseStatus"
    }
}

enum ViewerResponseMessage: Decodable {
    case data(ViewerResponseData)
    case errors(ViewerResponseErrors)
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let data = try? container.decode(ViewerResponseData.self) {
            self = .data(data)
        } else if let errors = try? container.decode(ViewerResponseErrors.self) {
            self = .errors(errors)
        } else {
            throw DecodingError.typeMismatch(ViewerResponseMessage.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unknown response message type"))
        }
    }
}

// Define the struct for success data
struct ViewerResponseData: Decodable {
    let countryCode: String
    let id: Int
    let viewerEmail: String
    let viewerName: String
    let viewerPass: String
    let viewerPhone: String
    
    enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case id = "id"
        case viewerEmail = "viewer_email"
        case viewerName = "viewer_name"
        case viewerPass = "viewer_pass"
        case viewerPhone = "viewer_phone"
    }
}

// Define the struct for error messages
struct ViewerResponseErrors: Decodable {
    let viewerEmail: [String]?
    let viewerPass: [String]?
    
    enum CodingKeys: String, CodingKey {
        case viewerEmail = "viewer_email"
        case viewerPass = "viewer_pass"
    }
}
