//
//  AddListViewController.swift
//  Todo List
//
//  Created by Junior Fernandes on 25/01/21.
//

import UIKit

class AddListViewController: UIViewController {
    var todos: [String] = []
    @IBOutlet weak var tfTitulo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func actionAdd(_ sender: Any) {
        self.todos.append(self.tfTitulo.text!)
        Network.shared.addTodo(title: self.todos)
    }

}
