//
//  OrderItemsModel.swift
//  ribeat-mc
//
//  Created by Neamțu Ionuț-Roberto on 4/7/19.
//  Copyright © 2019 888 Funcional Monkeys. All rights reserved.
//

import Foundation

class OrderItemModel: Codable {
    
    var id: String
    var quantity: Int
    var productName: String
    
    private enum CodingKeys: String, CodingKey {
        case id, productName, quantity
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        //try container.encode()
    }
    
    required init(from decoder: Decoder) throws {
        let containter = try decoder.container(keyedBy: CodingKeys.self)
        id = try containter.decode(String.self, forKey: .id)
        productName = try containter.decode(String.self, forKey: .productName)
        quantity = try containter.decode(Int.self, forKey: .quantity)
    }
    
    
}
