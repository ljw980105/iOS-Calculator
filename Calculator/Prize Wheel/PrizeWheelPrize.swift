//
//  PrizeWheelPrize.swift
//  Calculator
//
//  Created by Jing Wei Li on 11/22/20.
//  Copyright © 2020 Jing Wei Li. All rights reserved.
//

import Foundation

struct PrizeWheelPrize: Codable {
    let name: String
    
    static let prizes: [PrizeWheelPrize] = {
        return [
            PrizeWheelPrize(name: "🍕"),
            PrizeWheelPrize(name: "🥬"),
            PrizeWheelPrize(name: "🧇"),
            PrizeWheelPrize(name: "🥃"),
            PrizeWheelPrize(name: "🍎"),
            PrizeWheelPrize(name: "🥮"),
            PrizeWheelPrize(name: "🍰"),
            PrizeWheelPrize(name: "🍩"),
        ]
    }()
}
