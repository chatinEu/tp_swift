//
//  TodoCellData.swift
//  tp-todolist-new
//
//  Created by Eudes Chatin on 03/12/2021.
//

import Foundation
class TodoCellData{
    var title = String()
    var description = String()
    var state = Bool()
    var date : Date?
    
    init(title:String, desc:String, state:Bool = false, date:Date){
        self.title = title
        description = desc
        self.state = state
        self.date = date
    }
    init(title:String, desc:String, state:Bool = false){
        self.title = title
        description = desc
        self.state = state
    }
}
