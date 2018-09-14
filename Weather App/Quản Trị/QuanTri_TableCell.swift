//
//  QuanTri_TableCell.swift
//  Weather App
//
//  Created by mac on 8/30/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class QuanTri_TableCell: UITableViewCell
{

    @IBOutlet weak var lbl_Thu: UILabel!
    @IBOutlet weak var lbl_ThongBao: UILabel!
    
    @IBOutlet weak var Img_Hinh: UIImageView!
    @IBOutlet weak var lbl_NhietDo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
