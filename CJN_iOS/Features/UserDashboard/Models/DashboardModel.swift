//
//  Dashboard.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 05/06/24.
//

import Foundation

struct Dashboard : Decodable {
    
    let id : Int
    let showID : Int
    let timestampForStatistics : String
    let viewersLoggedIn : Int
    let numberOfGuardians : Int
    let numberOfEmployers : Int
    let numberOfRecruitingManagers : Int
    let numberOfFaculty : Int
    let numberOfHeadInstitution : Int
    let numberOfPeopleStaffingAgency : Int
    let numberOfPeopleFromAssessmentCompany : Int
    let status : Int
    let createdAt : String
    let updatedAt : String
    
    enum CodingKeys : String,CodingKey {
        case id
        case showID = "show_id"
        case timestampForStatistics = "timestamp_for_statistics"
        case viewersLoggedIn = "viewers_logedin"
        case numberOfGuardians = "number_of_gaurdians"
        case numberOfEmployers = "number_of_employers"
        case numberOfRecruitingManagers = "number_of_requiding_managers"
        case numberOfFaculty = "number_of_faculty"
        case numberOfHeadInstitution = "number_of_head_institution"
        case numberOfPeopleStaffingAgency = "number_of_people_stafing_agency"
        case numberOfPeopleFromAssessmentCompany = "number_of_people_from_assessment_company"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
