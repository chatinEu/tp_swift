//
//  ViewControllerTodoDetail.swift
//  tp-todolist-new
//
//  Created by Eudes Chatin on 03/12/2021.
//

import UIKit

class ViewControllerTodoDetail: UIViewController {

    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var checkboxButton: UIButton!
    
    var data: TodoCellData?
    var dataReady = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //si la valeur data a été importé
        if let todoTask = data {
            dataReady = true
            titleTextView.text = todoTask.title
            descriptionTextView.text = todoTask.description
        }
        else{
            titleTextView.text = "nothing to see here"
        }
    }
    
    
    @IBAction func confirmModifButton(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        if dataReady{
            
            dataReady = false
            data!.title = titleTextView.text
            data!.description = descriptionTextView.text
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    /*@IBAction func confirmModifButton(_ sender: Any) {
        
        dismiss(animated: true) {}
    }
    */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
