//
//  DrugCountCell.swift
//  DrugBox
//
//  Created by 김도연 on 2/23/24.
//

import UIKit

class DrugCountCell: UITableViewCell {

    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var ExpDateLabel: UILabel!
    @IBOutlet weak var CountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

