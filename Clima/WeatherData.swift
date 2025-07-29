//
//  WeatherData.swift
//  Clima
//
//  Created by Nada jrad on 25/07/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Decodable {
    let name : String
    let main :main
    let weather : [Weather]
}
struct main : Decodable {
    let temp : Double
}

struct Weather : Decodable {
    let description : String
    let id : Int
}
