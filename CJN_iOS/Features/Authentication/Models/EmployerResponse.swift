//
//  EmployerRegistrationResponse.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 03/06/24.
//


import Foundation
struct EmployerResponse: Decodable {
    let responseMessage: EmployerResponseMessage
    let responseStatus: Bool
    
    enum CodingKeys: String, CodingKey {
        case responseMessage = "responseMessage"
        case responseStatus = "responseStatus"
    }
}

enum EmployerResponseMessage: Decodable {
    case data(EmployerResponseData)
    case errors(EmployerResponseErrors)
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let data = try? container.decode(EmployerResponseData.self) {
            self = .data(data)
        } else if let errors = try? container.decode(EmployerResponseErrors.self) {
            self = .errors(errors)
        } else {
            throw DecodingError.typeMismatch(EmployerResponseMessage.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unknown response message type"))
        }
    }
}

//struct EmployerResponseMessage: Decodable {
//    let data : EmployerResponseData
//}

struct EmployerResponseData: Decodable {
    let countryCode: String
    let employerCompName: String
    let employerEmail: String
    let employerId: String
    let employerName: String
    let employerPass: String
    let employerPhone: String
    let employerPostName: String
    let employerYearOfExperience: Int
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case employerCompName = "employer_comp_name"
        case employerEmail = "employer_email"
        case employerId = "employer_id"
        case employerName = "employer_name"
        case employerPass = "employer_pass"
        case employerPhone = "employer_phone"
        case employerPostName = "employer_post_name"
        case employerYearOfExperience = "employer_year_of_experience"
        case id = "id"
    }
}


struct EmployerResponseErrors: Decodable {
    let employerEmail: [String]?
    let employerPass: [String]?
    
    enum CodingKeys: String, CodingKey {
        case employerEmail = "employer_email"
        case employerPass = "employer_pass"
    }
}
