//
//  TodoModel.swift
//  MVPTodoApp
//
//  Created by 大林拓実 on 2020/12/01.
//

import Foundation

protocol TodoModelInput {
    func fetchItems() -> [String]
    func addItem(itemContent: String, completion: () -> ())
    func deleteItem(forRow row: Int, completion: () -> ())
}

final class TodoModel: TodoModelInput {
    
    private let userDefaluts = UserDefaults.standard
    private let ITEM_KEY = "TodoItems"
    
    func fetchItems() -> [String] {
        return userDefaluts.array(forKey: ITEM_KEY) as! [String]
    }
    
    func deleteItem(forRow row: Int, completion: () -> ()) {
        var item = userDefaluts.array(forKey: ITEM_KEY) as! [String]
        item.remove(at: row)
        userDefaluts.set(item, forKey: ITEM_KEY)
        completion()
    }
    
    func addItem(itemContent: String, completion: () -> ()) {
        var item = userDefaluts.array(forKey: ITEM_KEY) as! [String]
        item.append(itemContent)
        userDefaluts.set(item, forKey: ITEM_KEY)
        completion()
    }

}
