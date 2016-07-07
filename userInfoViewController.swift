//
//  userInfoViewController.swift
//  LocalRetreat - Master
//
//  Created by Lauren Eisdorfer on 7/6/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit

class userInfoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var city: UITextField!
    let cities = ["Atlanta", "Boston", "Chicago", "New York", "San Francisco", "Seattle"]
    var picker = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        city.inputView = picker
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return cities.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        city.text = cities[row]
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }

}
