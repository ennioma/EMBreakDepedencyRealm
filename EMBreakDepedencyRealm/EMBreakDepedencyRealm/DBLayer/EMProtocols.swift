//
//  EMProtocols.swift
//  EMBreakDepedencyRealm
//
//  Created by Ennio Masi on 10/07/2017.
//  Copyright © 2017 ennioma. All rights reserved.
//

import Foundation
import RealmSwift

/*
 Dummy protocol for Entities
 */
public protocol Storable {
}
extension Object: Storable {
}
