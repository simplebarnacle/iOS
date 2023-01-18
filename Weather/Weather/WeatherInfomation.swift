//
//  WeatherInfomation.swift
//  Weather
//
//  Created by s ky on 2023/01/18.
//

import Foundation

struct WeatherInfomation: Codable {
    let weather: [Weather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
    case weather
    case temp = "main"
    case name
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Temp: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feels_like
        case temp_min
        case temp_max
    }
}
