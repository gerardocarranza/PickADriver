//
//  DisplayViewController.swift
//  PickADriver
//
//  Created by Gerardo Carranza on 11/20/19.
//  Copyright © 2019 Gerardo Carranza. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    var period = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = period
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! NamesTableViewController
        dvc.period = period
    }
    

}
