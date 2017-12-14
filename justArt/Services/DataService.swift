//
//  DataService.swift
//  justArt
//
//  Created by Sercan Yektaş on 6.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import Foundation

class DataService {
    
    static let userData = UserDefaults.standard
    
    
    // Gets the questions from API and saves them to UserDefaults with "questions" key
    class func saveQuestionsToLocalData() {
        var encodedQuestions: [Data] = []
        APIService.instance.getQuestions { (questions) in
            for question in questions{
                do {
                    encodedQuestions.append(Conversion.encodeObject(question: question) as! Data)
                }
            }
            userData.set(encodedQuestions, forKey: QUESTIONS_KEY)
        }
        
    }
    
    // Gets the artists from API and saves them to UserDefaults with "artists" key
    class func saveArtistsToLocalData() {
        var encodedArtists: [Data] = []
        APIService.instance.getArtists { (artists) in
            for artist in artists{
                do {
                    encodedArtists.append(Conversion.encodeObject(question: artist) as! Data)
                }
            }
            userData.set(encodedArtists, forKey: ARTISTS_KEY)
            }
    }
    
    class func getArtists() -> [Artist]{
        var artists : [Artist] = []
        var encodedArtists = userData.object(forKey: ARTISTS_KEY) as! [Data]
        encodedArtists.shuffle()
        for encodedArtist in encodedArtists{
            let artist: Artist = Conversion.decodeObject(encodedObject: encodedArtist)!
            artists.append(artist)
        }
        return artists
    }
    
    // Retrieve the questions from local data with a specific category
    class func getQuestions(withCategory category: String) -> [Question] {
        var questions: [Question] = []
        var encodedQuestions = userData.object(forKey: QUESTIONS_KEY) as! [Data]
        // Shuffle the questions
        encodedQuestions.shuffle()
        for encodedQuestion in encodedQuestions{
            let question: Question = Conversion.decodeObject(encodedObject: encodedQuestion)!
            for cat in question.category!{
                if cat.categoryName == category {
                    questions.append(question)
                    break
                }
            }
        }
        return questions
    }
}
