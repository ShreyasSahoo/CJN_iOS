//
//  CandidateRegistrationResponse.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 03/06/24.
//

import Foundation

struct CandidateResponse: Decodable {
    let responseMessage: CandidateResponseMessage
    let responseStatus: Bool
    
    enum CodingKeys: String, CodingKey {
        case responseMessage = "responseMessage"
        case responseStatus = "responseStatus"
    }
}

// Define an enum to represent the different types of response messages
enum CandidateResponseMessage: Decodable {
    case data(CandidateResponseData)
    case errors(CandidateResponseErrors)
    
    // Custom decoding to handle different structures
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let data = try? container.decode(CandidateResponseData.self) {
            self = .data(data)
        } else if let errors = try? container.decode(CandidateResponseErrors.self) {
            self = .errors(errors)
        } else {
            throw DecodingError.typeMismatch(CandidateResponseMessage.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unknown response message type"))
        }
    }
}

// Define the struct for success data
struct CandidateResponseData: Decodable {
    let candidateAcdYear: Int
    let candidateClgCode: String
    let candidateDept: String
    let candidateDob: String
    let candidateEmail: String
    let candidateGender: String
    let candidateId: String
    let candidateImagePath: String
    let candidateName: String
    let candidatePass: String
    let candidatePhone: Int
    let candidatePicture: String
    let candidateResume: String
    let candidateVidume: String
    let countryCode: String
    let createdAt: String
    let experience: Int
    let highestQualification: String
    let id: Int
    let isActive: Bool
    let skills: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case candidateAcdYear = "candidate_acd_year"
        case candidateClgCode = "candidate_clg_code"
        case candidateDept = "candidate_dept"
        case candidateDob = "candidate_dob"
        case candidateEmail = "candidate_email"
        case candidateGender = "candidate_gender"
        case candidateId = "candidate_id"
        case candidateImagePath = "candidate_image_path"
        case candidateName = "candidate_name"
        case candidatePass = "candidate_pass"
        case candidatePhone = "candidate_phone"
        case candidatePicture = "candidate_picture"
        case candidateResume = "candidate_resume"
        case candidateVidume = "candidate_vidume"
        case countryCode = "country_code"
        case createdAt = "created_at"
        case experience = "experience"
        case highestQualification = "highest_qualification"
        case id = "id"
        case isActive = "is_active"
        case skills = "skills"
        case updatedAt = "updated_at"
    }
}

// Define the struct for error messages
struct CandidateResponseErrors: Decodable {
    let candidateEmail: [String]?
    let candidatePass: [String]?
    
    enum CodingKeys: String, CodingKey {
        case candidateEmail = "candidate_email"
        case candidatePass = "candidate_pass"
    }
}
