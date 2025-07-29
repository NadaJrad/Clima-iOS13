//
//  WeatherData.swift
//  Clima
//
//  Created by Nada jrad on 25/07/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Codable {
    let name : String
    let main :main
    let weather : [Weather]
}
struct main : Codable {
    let temp : Double
}

struct Weather : Codable {
    let description : String
    let id : Int
}
