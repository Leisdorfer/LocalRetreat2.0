//
//  ContentViewController.swift
//  LocalRetreat - Master
//
//  Created by Lauren Eisdorfer on 7/12/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var joinButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!
    var descriptionText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.imageView.image = UIImage(named: self.imageFile)
            self.titleLabel.text = self.titleText
            self.descriptionLabel.text = self.descriptionText
        
        //Styled border buttons
            joinButton.layer.borderColor = UIColor.grayColor().CGColor
            joinButton.layer.borderWidth = 1
            joinButton.layer.cornerRadius = 5
        
            loginButton.layer.borderColor = UIColor.grayColor().CGColor
            loginButton.layer.borderWidth = 1
            loginButton.layer.cornerRadius = 5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
