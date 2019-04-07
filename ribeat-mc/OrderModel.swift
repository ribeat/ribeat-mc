//
//  OrderModel.swift
//  ribeat-mc
//
//  Created by Neamțu Ionuț-Roberto on 4/7/19.
//  Copyright © 2019 888 Funcional Monkeys. All rights reserved.
//

import Foundation

class OrderModel: Codable {
    
    var id: String
    var table: String
    var companyNumber: String?
    var datetime: Date
    var orderReady: Int
    var paymentType: String?
    var tipValue: Double?
    var totalPaid: Double?
    var waiter: String?
    var items: [OrderItemModel]
    
    private enum CodingKeys: String, CodingKey {
        case id, table, companyNumber, datetime, orderReady, paymentType, tipValue, totalPaid, waiter, items
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        //try container.encode()
    }
    
    required init(from decoder: Decoder) throws {
        let containter = try decoder.container(keyedBy: CodingKeys.self)
        id = try containter.decode(String.self, forKey: .id)
        table = try containter.decode(String.self, forKey: .table)
        orderReady = try containter.decode(Int.self, forKey: .orderReady)
        datetime = try containter.decode(Date.self, forKey: .datetime)
        items = try containter.decode([OrderItemModel].self, forKey: .items)

    /*
        
        companyNumber = try containter.decode(String.self, forKey: .companyNumber)
        
        paymentType = try containter.decode(String.self, forKey: .paymentType)
        tipValue = try containter.decode(Double.self, forKey: .tipValue)
        totalPaid = try containter.decode(Double.self, forKey: .totalPaid)
        waiter = try containter.decode(String.self, forKey: .waiter)
        //id = try containter.decode(String.self, forKey: .id)
        */
    }
    
    
}
