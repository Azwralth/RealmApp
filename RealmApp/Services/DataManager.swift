//
//  DataManager.swift
//  RealmApp
//
//  Created by Alexey Efimov on 08.10.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    
    private let storageManager = StorageManager.shared
    
    private init() {}
    
    func createTempData(completion: @escaping () -> Void) {
        let shopingList = TaskList()
        
        shopingList.title = "Shoping list"
        
        let bread = Task()
        bread.title = "Хлеб"
        bread.note = "2 батона"
        
        let apples = Task(value: ["Apples", "2кг"])
        
        shopingList.tasks.insert(contentsOf: [bread, apples], at: 0)
        
        DispatchQueue.main.async { [unowned self] in
            storageManager.save([shopingList])
            completion()
        }
    }
}
