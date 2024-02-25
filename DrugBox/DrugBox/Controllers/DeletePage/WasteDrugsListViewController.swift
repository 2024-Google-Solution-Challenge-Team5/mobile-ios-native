//
//  WasteDrugsListViewController.swift
//  DrugBox
//
//  Created by 김도연 on 2/25/24.
//

import UIKit

class WasteDrugsListViewController: UIViewController {
    
    @IBOutlet weak var ContentsTableView: UITableView!
    
    @IBOutlet weak var DeleteButton: UIButton!
    
    var WasteDrugs: [DrugModel] = [
        DrugModel(boxId: 1, drugName: "타이레놀정160mg", drugCount: 1, location: "거실 약상자", expDate: "2026-04-29".toDate()!, inDisposalList: false),
        DrugModel(boxId: 1, drugName: "타이레놀정160mg", drugCount: 3, location: "거실 약상자", expDate: "2026-04-29".toDate()!, inDisposalList: false),
        DrugModel(boxId: 1, drugName: "어린이부루펜시럽(80mL)", drugCount: 20, location: "부엌 찬장", expDate: "2028-01-10".toDate()!, inDisposalList: false),
        DrugModel(boxId: 1, drugName: "베아제정", drugCount: 2, location: "거실 약상자", expDate: "2027-10-05".toDate()!, inDisposalList: false),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContentsTableView.delegate = self
        ContentsTableView.dataSource = self
        
        ContentsTableView.register(UINib(nibName:K.tableCell.wasteDrugCellNibName, bundle: nil), forCellReuseIdentifier: K.tableCell.wasteDrugCellNibName)
        ContentsTableView.allowsMultipleSelection = true
        
//        ContentsTableView.rowHeight = UITableView.automaticDimension
//        ContentsTableView.estimatedRowHeight = UITableView.automaticDimension
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 28))
        header.backgroundColor = .systemBackground
        let headerLabel = UILabel(frame: header.bounds)
        headerLabel.text = "   나의 폐의약품"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 25)
        headerLabel.textAlignment = .left
        header.addSubview(headerLabel)
        
        ContentsTableView.tableHeaderView = header
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 다시 화면으로 돌아왔을 때 선택 해제
        if let selectedIndexPath = ContentsTableView.indexPathForSelectedRow {
            ContentsTableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
        
    }
    
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
//        print(ContentsTableView.indexPathsForSelectedRows ?? "0")
        let alert = UIAlertController(title: nil, message: "폐기 인증을 하시겠습니까?", preferredStyle: .alert)
    
        let yesAction = UIAlertAction(title: "Yes", style: .default)
        let noAction = UIAlertAction(title: "No", style: .cancel) { _ in
            if let selected = self.ContentsTableView.indexPathsForSelectedRows {
                for idx in selected {
                    self.WasteDrugs.remove(at: idx[1])
                    self.ContentsTableView.deselectRow(at: idx, animated: true)
                }
            }
            self.ContentsTableView.reloadData()
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

extension WasteDrugsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WasteDrugs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let drug = WasteDrugs[indexPath.row]
        let cell = ContentsTableView.dequeueReusableCell(withIdentifier: K.tableCell.wasteDrugCellNibName, for: indexPath) as! WasteDrugCell
        
        cell.NameLabel.text = drug.drugName
        cell.CountLabel.text = "\(drug.drugCount)"
        
        return cell
    }
    
}

