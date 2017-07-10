//
//  PFARecord.swift
//  EMBreakDepedencyRealm
//
//  Created by Ennio Masi on 10/07/2017.
//  Copyright © 2017 ennioma. All rights reserved.
//

import Foundation
import RealmSwift

public class PFARecord: Object {
    dynamic var recordID = UUID().uuidString
    private(set) dynamic var addDate = Date()
    dynamic var title: String = ""
    dynamic var price: Double = 0.0
    
    override public static func primaryKey() -> String? {
        return "recordID"
    }
    
    override public var description: String {
        return "\(self.recordID)\n\(self.title)\n\(self.price)\n"
    }
}
