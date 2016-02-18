//
//  IGVTableViewCell.swift
//  IgvPeruApple
//
//  Created by Gonzalo on 17/02/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit

class IGVTableViewCell: UITableViewCell {

    @IBOutlet weak var fechaDePago: UILabel!
    @IBOutlet weak var mes: UILabel!
    func configureCellWith(mes: String,fech: String){
        self.fechaDePago.text = fech
        self.mes.text = mes
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
