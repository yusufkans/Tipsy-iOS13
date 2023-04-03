//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Yusufkan Sürmelioğlu on 3.04.2023.
//  Copyright © 2023 vestel. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalBill: Double?
    var tip: Double?
    var split: Double?
    var result: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsLabel.text = "Split between \(String(Int(split!))) people, with %\(String(Int(tip! * 100))) tip."
        totalLabel.text = String(format: "%.2f", result ?? "Error")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
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
