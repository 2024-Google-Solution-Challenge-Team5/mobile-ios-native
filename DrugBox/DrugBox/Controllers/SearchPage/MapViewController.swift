//
//  MapViewController.swift
//  DrugBox
//
//  Created by 김도연 on 1/27/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
//
    
    @IBOutlet weak var FirstSelect: UILabel!
    @IBOutlet weak var SecondSelect: UILabel!
    
    // pickerView 에 담고 싶은 정보를 배열로 표현했다.
    let numbersString: [String] = ["서울특별시"]
    let numbers: [String] = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"]
    
    
                             
    // UIPickerViewDelegate, UIPickerViewDatsSource 프로토콜을 구현해줘야 한다.
    
    // pickerView에 표현하고 싶은 아이템의 갯수
    // 각각의 component 마다 다른 값을 갖게 한다.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return numbersString.count
        } else {
            return numbers.count
        }
    }
    
    // pickerView에서 특정 아이템을 선택했을 때의 행위
    // 각각의 component 마다 다른 값을 갖게 한다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if component == 0 {
//            FirstSelect.text = numbersString[row]
//        } else {
//            SecondSelect.text = numbers[row]
//        }
    }
    
    // pickerView에서 보여주고 싶은 아이템의 제목
    // 각각의 component 마다 다른 값을 갖게 한다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return numbersString[row]
        } else {
            return numbers[row]
        }
    }
    
    // pickerView에 담긴 아이템의 컴포넌트 갯수
    // pickerView는 여러 개의 wheel이 있을 수 있다.
    // 여기서는 2개의 wheel을 가진 pickerView를 표현했다.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    @IBOutlet weak var pickerView: UIPickerView! {
        didSet {
            // pickerView 의 delegate, dataSource 를 반영하는 코드
            pickerView.delegate = self
            pickerView.dataSource = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
//        let urlString = "\(K.apiURL.GETLocationURL)\(String(describing: FirstSelect.text))&addrLvl2=\(String(describing: SecondSelect.text))"
        self.performSegue(withIdentifier: K.searchSegue.showLocationList, sender: self)
        
    }
}
