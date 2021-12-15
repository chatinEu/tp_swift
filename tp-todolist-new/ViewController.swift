//
//  ViewController.swift
//  tp-todolist-new
//
//  Created by Eudes Chatin on 03/12/2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tableView_TodoList: UITableView!
    
    var TodoCellList = [TodoCellData]()
    var lastIndexSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TodoCellList.append(TodoCellData(title: "title", desc: "description"))
        TodoCellList.append(TodoCellData(title: "title2", desc: "yes"))
        TodoCellList.append(TodoCellData(title: "title3", desc: "gimme more"))
        TodoCellList.append(TodoCellData(title: "work", desc: "description"))
        TodoCellList.append(TodoCellData(title: "now", desc: "vewrverw"))
        TodoCellList.append(TodoCellData(title: "no", desc: "fesd"))
        TodoCellList.append(TodoCellData(title: "time", desc: "gregrebnhe"))
        TodoCellList.append(TodoCellData(title: "title", desc: "description"))
        
        tableView_TodoList.dataSource = self
    }
    
    
    //return the size of the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return TodoCellList.count
    }
    
    
    //   set the content of each cell of the tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TableViewCell_TodoCell
        
        cell.importData(data: TodoCellList[indexPath.row])
        
        return cell
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
    
    
    /*
     unwind segue from addTask panel
     */
    @IBAction func addTask(_ unwindSegue: UIStoryboardSegue) {
        print("back to me")
        if let sourceViewController = unwindSegue.source as? ViewControllerAddTask {
            let data = TodoCellData(title: sourceViewController.titleTextField.text!, desc: sourceViewController.descriptionTextField.text!)
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

