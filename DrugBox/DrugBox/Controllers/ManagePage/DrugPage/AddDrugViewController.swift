//
//  AddDrugViewController.swift
//  DrugBox
//
//  Created by 김도연 on 2/13/24.
//

import UIKit
import Alamofire

class AddDrugViewController: UIViewController {
    
    @IBOutlet weak var CancelButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

