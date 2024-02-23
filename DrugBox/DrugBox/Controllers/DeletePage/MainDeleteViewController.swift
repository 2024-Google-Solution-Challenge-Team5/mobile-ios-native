//
//  MainDeleteViewController.swift
//  DrugBox
//
//  Created by 김도연 on 1/27/24.
//

import UIKit

class MainDeleteViewController: UIViewController {
    @IBOutlet weak var ContentsTableView: UITableView!
    
    var contents: [String] = ["폐의약품 분리배출", "서울권 지역 폐기 방법", "폐의약품 분리배출 안내(성동구)", "폐의약품 분리배출 안내(서초구)"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        ContentsTableView.delegate = self
        ContentsTableView.dataSource = self
        
        ContentsTableView.register(UINib(nibName:K.tableCell.contentCellNibName, bundle: nil), forCellReuseIdentifier: K.tableCell.contentCellNibName)
        ContentsTableView.rowHeight = UITableView.automaticDimension
        ContentsTableView.estimatedRowHeight = UITableView.automaticDimension
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 28))
        header.backgroundColor = .systemBackground
        let headerLabel = UILabel(frame: header.bounds)
        headerLabel.text = "   의약품 폐기 방법"
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
    
}

extension MainDeleteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = contents[indexPath.row]
        let cell = ContentsTableView.dequeueReusableCell(withIdentifier: K.tableCell.contentCellNibName, for: indexPath) as! WayToDelete
        
        cell.TitleName.text = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //테이블뷰의 이벤트처리 함수
        self.performSegue(withIdentifier: K.deleteSegue.showInformationContents, sender: self)
    }
    
}
