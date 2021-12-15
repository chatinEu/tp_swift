//
//  ViewControllerAddTask.swift
//  tp-todolist-new
//
//  Created by Eudes Chatin on 15/12/2021.
//

import UIKit

class ViewControllerAddTask: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var switchTimeLimit: UISwitch!
    
    @IBAction func onTimeLimitSwitched(_ sender: Any) {
        datePicker.isEnabled = !switchTimeLimit.isOn
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.isEnabled = !switchTimeLimit.isOn
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
