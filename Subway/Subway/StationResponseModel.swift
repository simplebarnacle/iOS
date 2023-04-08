//
//  StationResponseModel.swift
//  Subway
//
//  Created by jayden on 2023/04/08.
//

import Foundation

struct StationResponseModel: Decodable {
    var stations: [Station] { searchInfo.row }
    
    private let searchInfo: realtimeStationArrival
    
    enum CodingKeys: String, CodingKey {
        case searchInfo = "realtimeStationArrival"
    }
    
    struct realtimeStationArrival: Decodable {
        var row: [Station] = []
    }
}

struct Station: Decodable {
    let stationName: String
    let lineNumber: String
    
    enum CodingKeys: String, CodingKey {
        case stationName = "statnNm"
        case lineNumber = "LINE_NUM"
    }
}
