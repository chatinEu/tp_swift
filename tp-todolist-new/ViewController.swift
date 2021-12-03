//
//  ViewController.swift
//  tp-todolist-new
//
//  Created by Eudes Chatin on 03/12/2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tableView_TodoList: UITableView!
    var celltitles = [String]()
    var cellDescription = [String]()
    
    var TodoCellList = [TodoCellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        celltitles = ["1","second","last","roar","bwate","title vachement long que sa rentrera pas"]
        tableView_TodoList.dataSource = self
        
        //TodoCellList.append(TodoCellData("title","description"))
        
        //UIStoryboardSegue
    }
    
    
    //return the size of the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return celltitles.count
    }
    
    
    //   set the content of each table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TableViewCell_TodoCell
        cell.Label_Title.text = celltitles[ indexPath.row]
        //TodoCellList
        
        return cell
    }
    
    

}

