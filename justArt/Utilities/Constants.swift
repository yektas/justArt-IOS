//
//  Constants.swift
//  justArt
//
//  Created by Sercan Yektaş on 5.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import Foundation

// API Endpoints
let API_BASE_URL = "http://127.0.0.1:8000/api"
let QUESTIONS_URL = "\(API_BASE_URL)/questions"
let ARTISTS_URL = "\(API_BASE_URL)/artists"

// Keys for UserDefaults
let QUESTIONS_KEY = "questions"
let ARTISTS_KEY = "artists"

// Game Settings
let TOTAL_QUESTIONS = 10
let TIMEOUT_VALUE = 20

//Segues
let TO_CATEGORY = "toCategory"
let TO_GAME = "toGame"
let TO_ENDSCREEN = "toEndScreen"
