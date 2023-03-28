//
//  MyPoint.swift
//  TossBenefitTab
//
//  Created by s ky on 2023/03/03.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
}

extension MyPoint {
    static let `default` = MyPoint(point: 0)
}
