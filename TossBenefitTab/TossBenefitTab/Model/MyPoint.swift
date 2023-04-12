//
//  MyPoint.swift
//  TossBenefitTab
//
//  Created by jayden on 2023/04/12.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
}

extension MyPoint {
    static let `default` = MyPoint(point: 0) // `default` 예약어 설정
}
