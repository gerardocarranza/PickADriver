//
//  PeriodViewController.swift
//  PickADriver
//
//  Created by Gerardo Carranza on 11/13/19.
//  Copyright © 2019 Gerardo Carranza. All rights reserved.
//

import UIKit

class PeriodViewController: UIViewController {

    var period = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onPeriodButtonTapped(_ sender: UIButton) {
        period = (sender.titleLabel?.text)!
        performSegue(withIdentifier: "PeriodToDisplaySegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dvc = segue.destination as! DisplayViewController
        dvc.period = period
        
        
    }

}
