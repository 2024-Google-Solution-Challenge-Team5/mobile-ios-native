//
//  ShowDrugDetailViewController.swift
//  DrugBox
//
//  Created by 김도연 on 2/13/24.
//

import UIKit
import Alamofire

class ShowDrugDetailViewController: UIViewController {
    
    @IBOutlet weak var DrugImageView: UIImageView!
    @IBOutlet weak var DrugCountTableView: UITableView!
    @IBOutlet weak var DrugInfoTextView: UITextView!
    
    var DrugCount : [DrugModel] = [
        DrugModel(boxId: 1, drugName: "타이레놀정160mg", drugCount: 6, location: "거실 약상자", expDate: "2026-04-29".toDate()!, inDisposalList: false),
        DrugModel(boxId: 1, drugName: "타이레놀정160mg", drugCount: 4, location: "식탁 서랍장", expDate: "2024-01-13".toDate()!, inDisposalList: false),
        DrugModel(boxId: 1, drugName: "타이레놀정160mg", drugCount: 10, location: "부엌 찬장", expDate: "2028-10-30".toDate()!, inDisposalList: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DrugCountTableView.delegate = self
        DrugCountTableView.dataSource = self

        DrugCountTableView.register(UINib(nibName: K.tableCell.countCellNibName, bundle: nil), forCellReuseIdentifier: K.tableCell.countCellIdentifier)
        DrugCountTableView.rowHeight = UITableView.automaticDimension
        DrugCountTableView.estimatedRowHeight = UITableView.automaticDimension
        
        DrugInfoTextView.text = K.drugContents.dummy
        // Do any additional setup after loading the view.
    }
    

}

extension ShowDrugDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DrugCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let count = DrugCount[indexPath.row]
        let cell = DrugCountTableView.dequeueReusableCell(withIdentifier: K.tableCell.countCellIdentifier, for: indexPath) as! DrugCountCell
        
        cell.LocationLabel.text = "\(count.location)"
        cell.CountLabel.text = "\(count.drugCount)개"
        cell.ExpDateLabel.text = count.expDate.toCountDateString()
        
        return cell
    }
    
    
    
}
