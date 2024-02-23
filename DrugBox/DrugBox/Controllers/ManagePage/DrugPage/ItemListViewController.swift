//
//  ItemListViewController.swift
//  DrugBox
//
//  Created by 김도연 on 2/4/24.
// 약 리스트 페이지. 멀티 선택 가능한

import UIKit
import Alamofire

class ItemListViewController: UIViewController {
    @IBOutlet weak var DrugTableView: UITableView!
    @IBOutlet weak var AddNewDrugButton: UIBarButtonItem!
    @IBOutlet weak var UseDrugButton: UIButton!
    
    var Drugs : [DrugModel] = [
        DrugModel(boxId: 1, drugName: "타이레놀정160mg", drugCount: 6, location: "거실 약상자", expDate: "2026-04-29".toDate()!, inDisposalList: false),
        DrugModel(boxId: 1, drugName: "어린이부루펜시럽(80mL", drugCount: 80, location: "부엌 찬장", expDate: "2028-01-10".toDate()!, inDisposalList: false),
        DrugModel(boxId: 1, drugName: "베아제정", drugCount: 7, location: "거실 약상자", expDate: "2027-10-05".toDate()!, inDisposalList: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DrugTableView.delegate = self
        DrugTableView.dataSource = self

        DrugTableView.register(UINib(nibName: K.tableCell.drugCellNibName, bundle: nil), forCellReuseIdentifier: K.tableCell.drugCellIdentifier)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 다시 화면으로 돌아왔을 때 선택 해제
        if let selectedIndexPath = DrugTableView.indexPathForSelectedRow {
            DrugTableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
        
    }
    
    
    @IBAction func addDrugButtonPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: K.manageSegue.addDrugSegue, sender: self)
    }
    
//    func getDrugList(_ drugboxId: Int) {
//        let urlString = "\(K.apiURL.GETDrugURL)\(drugboxId)"
//        if let url = URL(string: urlString) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    print(error)
//                    return
//                }
//                guard let data = data else {
//                    print("no data")
//                    return
//                }
//                do {
//                    //self.boxSetting = self.parseJSON(data)
//                }
//            }
//            task.resume()
//        }
//    }
    
    func parseJSON(_ data: Data) -> [DrugModel] {
        var returnList : [DrugModel] = []
        let decoder = JSONDecoder()
        do {
            let decodedData = try! decoder.decode([DrugListData].self, from: data)
            for data in decodedData {
                if let expDate = data.expDate.toDate() {
                    let boxId = data.id
                    let drugName = data.name
                    let drugCount = data.count
                    let location = data.location
                    let inDisposalList = data.inDisposalList
                    returnList.append(DrugModel(boxId: boxId, drugName: drugName, drugCount: drugCount, location: location, expDate: expDate, inDisposalList: inDisposalList))
                } else {
                    print("error : no expiry date data.")
                }
                
            }
        }
        return returnList
    }
    
}

extension ItemListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Drugs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let drug = Drugs[indexPath.row]
        let cell = DrugTableView.dequeueReusableCell(withIdentifier: K.tableCell.drugCellIdentifier, for: indexPath) as! DrugCell
        
        cell.DrugNameLabel.text = "\(drug.drugName)"
        cell.DrugCountLabel.text = "\(drug.drugCount)"
        
//        cell.delegate = self
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //테이블뷰의 이벤트처리 함수
//        print("테이블뷰 셀이 클릭 되었다!")
        // segue call
        self.performSegue(withIdentifier: K.manageSegue.showDetailSegue, sender: self)
//        self.prepare(for: UIStoryboardSegue.init(identifier: K.manageSegue.showDetailSegue, source: self, destination: ItemListViewController()), sender: self)
        
//        boxTableView.deselectRow(at: indexPath, animated: true) // 색 원상태로 복귀
    }
    
    
}


struct DrugListData: Codable{
    let id: Int
    let name: String
    let count: Int
    let location: String
    let expDate: String
    let inDisposalList: Bool
}
