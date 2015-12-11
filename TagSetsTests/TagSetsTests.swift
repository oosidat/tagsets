//
//  TagSetsTests.swift
//  TagSetsTests
//
//  Created by Osama Sidat on 12/7/15.
//  Copyright © 2015 Osama Sidat. All rights reserved.
//

import UIKit
import XCTest
@testable import TagSets

class TagSetsTests: XCTestCase {
    
    // MARK: TagSets Tests
    
    func testTagSetInitialization() {
        
        let potentialItem = TagSet(name: "Photography")
        XCTAssertNotNil(potentialItem)
        
        let nilItem = TagSet(name: "")
        XCTAssertNil(nilItem)
    }
    
    
}
