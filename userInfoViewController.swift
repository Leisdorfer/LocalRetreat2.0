//
//  userInfoViewController.swift
//  LocalRetreat - Master
//
//  Created by Lauren Eisdorfer on 7/6/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit

class userInfoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var switchButton: UISwitch!
    
    @IBOutlet weak var tripReviewer: UIButton!
    
    let cities = ["Atlanta", "Boston", "Chicago", "New York", "San Francisco", "Seattle"]
    
    var picker = UIPickerView()
    
    var localTripReviewerInterest: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripReviewer.layer.borderColor = UIColor.grayColor().CGColor
        tripReviewer.layer.borderWidth = 1
        tripReviewer.layer.cornerRadius = 5
        picker.delegate = self
        picker.dataSource = self
        city.inputView = picker
        
    }
    
    
    @IBAction func interestedSwitch(sender: UISwitch) {
        if switchButton.on{
            localTripReviewerInterest = true
        }else{
            localTripReviewerInterest = false
        }
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

    @IBAction func tripReviewerPopOver(sender: UIButton) {
        self.performSegueWithIdentifier("showView", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showView"{
            let vc = segue.destinationViewController
            let controller = vc.popoverPresentationController
            
            if controller != nil{
                controller?.delegate = self
              //  controller?.popoverLayoutMargins = UIEdgeInsetsMake(250, 100, 250, 100)
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}