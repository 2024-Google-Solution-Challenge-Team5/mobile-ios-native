//
//  LocatioonResultViewController.swift
//  DrugBox
//
//  Created by 김도연 on 2/24/24.
//

import UIKit
import Alamofire

class LocatioonResultViewController: UIViewController {
    
    @IBOutlet weak var ResultTableView: UITableView!
    
    var locationList: [tempModel] = [
    tempModel(address: "서울특별시 마포구 동교로15길 7", detail: "서교동 주민센터"),
    tempModel(address: "서울특별시 마포구 망원로1길 27", detail: "망원 2차 대림 아파트"),
    tempModel(address: "서울특별시 마포구 월드컵북로30길 22", detail: "성산2동 주민센터"),
    tempModel(address: "서울특별시 마포구 도화길 37", detail: "도화동 주민센터"),
    tempModel(address: "서울특별시 마포구 독막로 145", detail: "서강 쌍용 예가 아파트"),
    tempModel(address: "서울특별시 마포구 희우정로 77", detail: "마포한강 아이파크 아파트"),
    tempModel(address: "서울특별시 마포구 망원로4길 8", detail: "망원 성원 2차 아파트"),
    tempModel(address: "서울특별시 마포구 포은로6길 10", detail: "망원1동 주민센터"),
    tempModel(address: "서울특별시 마포구 토정로31길 31", detail: "용강동 주민센터"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ResultTableView.delegate = self
        ResultTableView.dataSource = self
        ResultTableView.register(UINib(nibName: K.tableCell.locationCellNibName, bundle: nil), forCellReuseIdentifier: K.tableCell.locationCellNibName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 다른 뷰 갓다와서 업데이트할 건 여기다가
//        let userid = MenuSelectViewController.userID
//        getDrugBoxList(userid) // 데이터 없어서 에러뜸 잠시
        
        // 다시 화면으로 돌아왔을 때 선택 해제
        if let selectedIndexPath = ResultTableView.indexPathForSelectedRow {
            ResultTableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
        
    }
    

}

//MARK: - test model
struct tempModel: Codable {
    let address : String
    let detail : String
}
//MARK: - test data
struct tempData: Codable{
    let address : String
    let detail : String
}

extension LocatioonResultViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let loc = locationList[indexPath.row]
        let cell = ResultTableView.dequeueReusableCell(withIdentifier: K.tableCell.locationCellNibName, for: indexPath) as! LocationCell
        
        cell.DetailLabel.text = loc.detail
        cell.AddressLabel.text = " \(loc.address)"
        
        
        return cell
    }
    
    
}
