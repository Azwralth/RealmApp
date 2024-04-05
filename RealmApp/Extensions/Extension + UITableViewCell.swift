//
//  Extension + UITableViewCell.swift
//  RealmApp
//
//  Created by Владислав Соколов on 05.04.2024.
//  Copyright © 2024 Alexey Efimov. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func configure(_ taskList: TaskList) {
        let currentTaskCount = taskList.tasks.filter("isComplete == false").count
        var content = defaultContentConfiguration()
        content.text = taskList.title
        
        if currentTaskCount > 0 {
            content.secondaryText = "\(currentTaskCount)"
            accessoryType = .none
        } else if taskList.tasks.isEmpty {
            content.secondaryText = "0"
            accessoryType = .none
        } else {
            content.secondaryText = nil
            accessoryType = .checkmark
        }
        contentConfiguration = content
    }
}
