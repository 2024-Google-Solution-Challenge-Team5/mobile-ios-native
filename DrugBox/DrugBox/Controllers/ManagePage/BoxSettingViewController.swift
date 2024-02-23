//
//  BoxSettingViewController.swift
//  DrugBox
//
//  Created by 김도연 on 2/9/24.
//

import UIKit
import Alamofire

class BoxSettingViewController: UIViewController {
    
    @IBOutlet weak var BoxImageView: UIImageView!
    @IBOutlet weak var NameLabelEditButton: UIButton!
    @IBOutlet weak var BoxNameLabel: UILabel!
    @IBOutlet weak var MemberAddButton: UIButton!
    @IBOutlet weak var ImageChangeButton: UIButton!
    @IBOutlet weak var MemberTableView: UITableView!
    
    var drugBoxId : Int?
    var boxInviteCode : String?
    var boxSetting : BoxSettingModel?
    
    var boxUsers : [User] = [
        User(nickname: "D_r_thy", userId: 12), User(nickname: "goodbox9876", userId: 15)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getBoxDetail(drugBoxId ?? 0)
        boxSetting = BoxSettingModel(boxName: "거실 구급상자", drugboxId: 1, imageURL: "box_dummy", inviteCode: "1234-2343-8764-1224", users: [User(nickname: "D_r_thy", userId: 12), User(nickname: "goodbox9876", userId: 15)])
        DispatchQueue.main.async {
            self.BoxNameLabel.text = self.boxSetting!.boxName
//            if let url = URL(string: self.boxSetting!.imageURL) {
//                self.BoxImageView.loadImage(url: url)
//            } else {
//                self.BoxImageView.image = UIImage(systemName: K.drugboxDefaultImage)
//            }
            if let url = UIImage(named: self.boxSetting?.imageURL ?? K.drugboxDefaultImage) {
                self.BoxImageView.image = url
                self.BoxImageView.contentMode = .scaleAspectFit
            }
            self.boxInviteCode = self.boxSetting!.inviteCode
        }
        
        MemberTableView.delegate = self
        MemberTableView.dataSource = self

        MemberTableView.register(UINib(nibName: K.tableCell.memberCellNibName, bundle: nil), forCellReuseIdentifier: K.tableCell.memberCellNibName)
        MemberTableView.rowHeight = UITableView.automaticDimension
        MemberTableView.estimatedRowHeight = UITableView.automaticDimension
        
    }
    
    
    @IBAction func editNameButtonPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func changeImageButtonPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func addMemberButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.manageSegue.inviteSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.manageSegue.inviteSegue {
            let destinationVC = segue.destination as! InviteViewController
            destinationVC.boxID = self.drugBoxId
            destinationVC.InviteCode = self.boxInviteCode
            print(self.boxInviteCode ?? 0)
        }
    }
    
    // api call
//    func patchImage(_ img: UIImage) {
//        
//    }
    // api call
//    func patchName(_ name: String, _ boxId: Int) {
//        let urlString = "\(K.apiURL.baseURL)/setting/name?drugboxId=\(boxId)&name=\(name)"
//    }
    
//MARK: - GET api
    func getBoxDetail(_ drugBoxId: Int){
        let urlString = "\(K.apiURL.GETboxDetailURL)\(drugBoxId)"
//        print(urlString)
        if let url = URL(string: urlString) {
            // 2. create a URLSession
            let session = URLSession(configuration: .default)
            // 3. give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                guard let data = data else {
                    print("no data")
                    return
                }
                do {
                    self.boxSetting = self.parseJSON(data)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> BoxSettingModel? {
        var boxsetting : BoxSettingModel?
        let decoder = JSONDecoder()
        do {
            let decodedData = try! decoder.decode(BoxSettingData.self, from: data)
            let name = decodedData.boxName
            let drugboxId = decodedData.drugboxId
            let imageURL = decodedData.imageURL
            let users = decodedData.users
            let code = decodedData.inviteCode
            boxsetting = BoxSettingModel(boxName: name, drugboxId: drugboxId, imageURL: imageURL, inviteCode: code, users: users)
            self.boxInviteCode = code
        }
        return boxsetting
    }
    
}

struct BoxSettingModel {
    let boxName: String
    let drugboxId: Int
    let imageURL: String
    let inviteCode: String
    let users: [User]
}

struct BoxSettingData: Codable {
    let boxName: String
    let drugboxId: Int
    let imageURL: String
    let inviteCode: String
    let users: [User]
}

struct User: Codable{
    let nickname: String
    let userId: Int
}

extension BoxSettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        boxUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = boxUsers[indexPath.row]
        let cell = MemberTableView.dequeueReusableCell(withIdentifier: K.tableCell.memberCellNibName, for: indexPath) as! MemberCell
        
        cell.NameLabel.text = user.nickname
        
        return cell
    }
    
    
}
