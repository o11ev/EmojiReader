//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by o11ev on 11.02.2022.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var nameTextFiled: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
    }

}
