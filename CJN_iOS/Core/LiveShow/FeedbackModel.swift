//
//  FeedbackModel.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 27/05/24.
//

import Foundation
struct Feedback : Decodable, Identifiable{
    let id , feedbackStatus , feedbackDisplayStatus , feedbackDisplayCount, feedbackDisplayValue : Int
    let feedbackDateTime, feedbackText, feedbackAudio, feedbackVideo, feedbackUserID, feedbackUser, feedbackUserRole, createdAt, updatedAt : String
    
}
