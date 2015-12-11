//
//  TagSetTableViewController.swift
//  TagSets
//
//  Created by Osama Sidat on 12/11/15.
//  Copyright © 2015 Osama Sidat. All rights reserved.
//

import UIKit

class TagSetTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var tagSets = [TagSet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleTagSets()
    }
    
    func loadSampleTagSets() {
        let set1 = TagSet(name: "Photography")!;
        let set2 = TagSet(name: "Cooking")!;
        let set3 = TagSet(name: "Travel")!;
        
        tagSets += [set1, set2, set3]
    }

}
