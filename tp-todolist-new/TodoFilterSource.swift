//
//  TodoFilterSource.swift
//  tp-todolist-new
//
//  Created by Eudes Chatin on 15/12/2021.
//

import UIKit

class TodoFilterSource: NSObject, UIPickerViewDataSource {
    var filterList = [String]()
    
    
    override init() {
        super.init()
        filterList.append("All")
        filterList.append("This week")
    }
    
    //nb column
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //nb line
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //let data = filterList[]
        return filterList.count   }
    
    
}
