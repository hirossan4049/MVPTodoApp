//
//  AppDelegate.swift
//  MVPTodoApp
//
//  Created by 大林拓実 on 2020/12/01.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 表示用にUserDefaultsに初期値持たせておく
        UserDefaults.standard.register(defaults: ["TodoItems": ["Item1",
                                                                "Item2",
                                                                "Item3",
                                                                "Item4",
                                                                "Item5"]])
        
        // 最初に表示する画面についてのView, Model, Presenterのインスタンスを生成
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! TodoListViewController
        let model = TodoModel()
        
        // PresenterとView、PresenterとModelは初期化時に紐づけられる
        let presenter = TodoListPresenter(view: view, model: model)
        
        // ViewとPresenterを紐づける
        view.inject(presenter: presenter)
        
        // 最初に表示する画面を設定
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

