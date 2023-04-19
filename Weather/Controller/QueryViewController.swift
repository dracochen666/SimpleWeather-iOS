//
//  QueryViewController.swift
//  Weather
//
//  Created by 陈龙 on 2022/9/5.
//

import UIKit

protocol QueryViewControllerDelegate {
    func didChangeCity(city: String)
}
class QueryViewController: UIViewController {

    var currentCity = ""
    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var queryCityTextField: UITextField!
    var queryDelegate: QueryViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentCityLabel.text = currentCity
        queryCityTextField.becomeFirstResponder() //queryCityTextField.resignFirstResponder()
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func query(_ sender: UIButton) {
        dismiss(animated: true)
        if !queryCityTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            queryDelegate?.didChangeCity(city: queryCityTextField.text!)
        }else{
            
        }

    }
    
    
    
    

}
