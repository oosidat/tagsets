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
        navigationItem.leftBarButtonItem = editButtonItem()
        
        loadSampleTagSets()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            tagSets.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
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
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let tagSetDetailViewController = segue.destinationViewController as! TagSetViewController
            if let selectedTagSetCell = sender as? TagSetTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedTagSetCell)!
                let selectedTagSet = tagSets[indexPath.row]
                tagSetDetailViewController.tagSet = selectedTagSet
            }
            
        }
        else if segue.identifier == "AddItem" {
            print("Adding new tagset")
            
        }
    }
    
    // MARK: Actions
    
    @IBAction func unwindToTagSetList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? TagSetViewController, tagSet = sourceViewController.tagSet {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tagSets[selectedIndexPath.row] = tagSet
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
                let newIndexPath = NSIndexPath(forRow: tagSets.count, inSection: 0)
                tagSets.append(tagSet)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }

}
