//
//  EmojiTableViewController.swift
//  EmojiReader
//
//  Created by o11ev on 04.02.2022.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var objects = [
        Emoji(emoji: "😍", name: "Love", description: "Let's love", isFavourite: false),
        Emoji(emoji: "⚽️", name: "Football", description: "Let's play together", isFavourite: false),
        Emoji(emoji: "🐈", name: "Cat", description: "Cat is the best animal", isFavourite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Emoji Reader"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath)
        as! EmojiTableViewCell
        
        let object = objects[indexPath.row]
        cell.set(object: object)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .delete
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let movedEmoji = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let done = doneAction(at: indexPath)
        let favourite = favouriteAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [done, favourite])
    }
    
    func doneAction(at IndexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Done") { (action, view, completion) in
            self.objects.remove(at: IndexPath.row)
            self.tableView.deleteRows(at: [IndexPath], with: .automatic)
            completion(true)
        }
        
        action.backgroundColor = .systemGreen
        action.image = UIImage(systemName: "checkmark.circle")
        
        return action
    }
    
    func favouriteAction(at IndexPath: IndexPath) -> UIContextualAction {
        
        var object = objects[IndexPath.row]
        
        let action = UIContextualAction(style: .normal, title: "Favourite") { (action, view, completion) in
            object.isFavourite.toggle()
            self.objects[IndexPath.row] = object
            completion(true)
        }
        
        action.backgroundColor = object.isFavourite ? .systemPurple : .systemGray
        action.image = UIImage(systemName: "heart")
        
        return action
    }
}
