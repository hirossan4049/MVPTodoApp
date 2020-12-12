//
//  ViewController.swift
//  MVPTodoApp
//
//  Created by 大林拓実 on 2020/12/01.
//

import UIKit

class TodoListViewController: UIViewController {
    
    private var presenter: TodoListPresenterInput!
    func inject (presenter: TodoListPresenterInput) {
        self.presenter = presenter
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()

        tableView.dataSource = self
        
    }
    
    @IBAction func addBtn(){
        self.presenter.addNewItem(itemContent: textField.text ?? "")
        textField.text = ""
    }
    
}

extension TodoListViewController: TodoListPresenterOutput {
    func updateItems() {
        
        tableView.reloadData()
    }
    
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.presenter.item(forRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        self.tableData.remove(at: indexPath.row)
        self.presenter.deleteItem(forRow: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
}
