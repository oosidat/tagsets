//
//  TagSet.swift
//  TagSets
//
//  Created by Osama Sidat on 12/11/15.
//  Copyright © 2015 Osama Sidat. All rights reserved.
//

import UIKit

class TagSet {
    // MARK: Properties
    var name: String
    
    // MARK: Initialization
    init?(name: String) {
        self.name = name
        
        if name.isEmpty {
            return nil
        }
    }
}
