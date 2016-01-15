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
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagSets.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TagSetTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TagSetTableViewCell

        let tagSet = tagSets[indexPath.row]
        
        cell.nameLabel.text = tagSet.name
        
        return cell
    }
    
    func loadSampleTagSets() {
        let set1 = TagSet(name: "Photography")!;
        let set2 = TagSet(name: "Cooking")!;
        let set3 = TagSet(name: "Travel")!;
        
        tagSets += [set1, set2, set3]
    }
    
    // MARK: Actions
    
    @IBAction func unwindToTagSetList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? TagSetViewController, tagSet = sourceViewController.tagSet {
            let newIndexPath = NSIndexPath(forRow: tagSets.count, inSection: 0)
            tagSets.append(tagSet)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }

}
