//
//  WasteDrugCell.swift
//  DrugBox
//
//  Created by 김도연 on 2/25/24.


import UIKit

class WasteDrugCell: UITableViewCell {
    
    @IBOutlet weak var CheckBoxImage: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var CountLabel: UILabel!
    
    var isCheck: Bool = false {
            didSet {
                let imageName = isCheck ? "checkmark.square" : "checkmark.square.fill"
                let hexColor = isCheck ? "555555" : "56A658"
                
                CheckBoxImage.image = UIImage(systemName: imageName)
                CheckBoxImage.tintColor = UIColor(hexCode: hexColor)
            }
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        isCheck.toggle()
    }
    
}

