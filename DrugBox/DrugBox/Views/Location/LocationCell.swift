//
//  LocationCell.swift
//  DrugBox
//
//  Created by 김도연 on 2/24/24.
//
import UIKit

class LocationCell: UITableViewCell {
    @IBOutlet weak var DetailLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

