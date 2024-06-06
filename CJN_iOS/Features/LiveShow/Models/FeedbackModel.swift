//
//  FeedbackModel.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 27/05/24.
//

import Foundation

struct Feedback : Decodable {
    let responseStatus : String
    let responseMessage : [FeedbackResponseMessage]
    
    struct FeedbackResponseMessage : Decodable,Identifiable {
        let feedbackID : Int
        let feedbackDateTime : String
        let feedbackText : String
        let feedbackAudio : String
        let feedbackVideo : String
        let feedbackStatus : Int
        let feedbackDisplayStatus : Int
        let feedbackDisplayCount : Int
        let feedbackDisplayValue : Int
        let feedbackUserID : String?
        let feedbackUser : String
        let feedbackUserRole : String
        let createdAt : String
        let updatedAt : String
        
        var id: Int { feedbackID }
        
        enum CodingKeys : String, CodingKey {
            case feedbackID = "feedback_id"
            case feedbackDateTime = "feedback_datetime"
            case feedbackText = "feedback_text"
            case feedbackAudio = "feedback_audio"
            case feedbackVideo = "feedback_video"
            case feedbackStatus = "feedback_status"
            case feedbackDisplayStatus = "feedback_display_status"
            case feedbackDisplayCount = "feedback_display_count"
            case feedbackDisplayValue = "feedback_display_value"
            case feedbackUserID = "feedback_user_id"
            case feedbackUser = "feedback_user"
            case feedbackUserRole = "feedback_user_role"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            
        }
    }
}
