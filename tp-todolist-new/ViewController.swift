//
//  ViewController.swift
//  tp-todolist-new
//
//  Created by Eudes Chatin on 03/12/2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource ,UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var pickerFilter: UIPickerView!
    
    @IBOutlet weak var tableView_TodoList: UITableView!
    
    var TodoCellList = [TodoCellData]()
    var lastIndexSelected = 0
    let todoFilterSource = TodoFilterSource()
    var filtered = [TodoCellData]()
    //var filterList = [Filters]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //pickerFilter.dataSource = todoFilterSource
        //pickerFilter.@
        
        
        TodoCellList.append(TodoCellData(title: "title", desc: "description"))
        TodoCellList.append(TodoCellData(title: "title2", desc: "yes"))
        TodoCellList.append(TodoCellData(title: "title3", desc: "gimme more"))
        TodoCellList.append(TodoCellData(title: "work", desc: "description"))
        TodoCellList.append(TodoCellData(title: "now", desc: "vewrverw"))
        TodoCellList.append(TodoCellData(title: "no", desc: "fesd"))
        TodoCellList.append(TodoCellData(title: "time", desc: "gregrebnhe"))
        TodoCellList.append(TodoCellData(title: "title", desc: "description"))
        
        
        filtered = TodoCellList.filter{ cell in return cell.date != nil}
        
        tableView_TodoList.dataSource = self
    }
    
    
    //return the size of the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return TodoCellList.count
            //return filtered.count
    }
    
    
    //   set the content of each cell of the tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TableViewCell_TodoCell
        
        cell.importData(data: TodoCellList[indexPath.row])
        //cell.importData(data: filtered[indexPath.row])
        
        return cell
    }
    
    
    //nb column
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //nb line
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //let data = filterList[]
        //return filterList.count
        return 3
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ViewControllerTodoDetail{
            lastIndexSelected = tableView_TodoList.indexPathForSelectedRow!.row
            controller.data = TodoCellList[lastIndexSelected]
        }
        
    }
    
    /*
     update data from detail page
     */
    @IBAction func backToMe(_ unwindSegue: UIStoryboardSegue) {
        print("back to me")
        if let sourceViewController = unwindSegue.source as? ViewControllerTodoDetail {
            let updatedData = TodoCellList[lastIndexSelected]
            
            updatedData.title = sourceViewController.titleTextView.text
            updatedData.description = sourceViewController.descriptionTextView.text
        }
        // Use data from the view controller which initiated the unwind segue
        
        tableView_TodoList.reloadData()
    }
    
    @IBAction func deleteTaskFromDetails(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? ViewControllerTodoDetail {
            TodoCellList.remove(at: lastIndexSelected)
        }
        
        tableView_TodoList.reloadData()
    }
    
    
    
    /*
     unwind segue from addTask panel
     */
    @IBAction func addTask(_ unwindSegue: UIStoryboardSegue) {
        print("back to me")
        if let vc = unwindSegue.source as? ViewControllerAddTask {
            var data : TodoCellData
            let timeLimited  = !vc.switchTimeLimit.isOn
            if(timeLimited){
                data = TodoCellData(title: vc.titleTextField.text!, desc: vc.descriptionTextField.text!, date: vc.datePicker.date)
            }
            else{
                data = TodoCellData(title: vc.titleTextField.text!, desc: vc.descriptionTextField.text!)
            }
            
            
            TodoCellList.append(data)
        }
        tableView_TodoList.reloadData()
    }
    
    
    
    
    /*
    override func beginAppearanceTransition(_ isAppearing: Bool, animated: Bool) {
        tableView_TodoList.reloadData()
        print("reloading")
    }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView_TodoList.reloadData()
    }*/

}

