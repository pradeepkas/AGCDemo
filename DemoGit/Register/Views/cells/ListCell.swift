//
//  ListCell.swift
//  DemoGit
//
//  Created by Pradeep Kumar on 11/06/21.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet private var imgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure( _ data: RegisterDetail) {
        self.imgView.image = UIImage(named: data.imageName)
    }
    
}
