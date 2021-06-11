//
//  HeaderView.swift
//  DemoGit
//
//  Created by Pradeep Kumar on 11/06/21.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet private var regiterButton: UIButton!
    
    var registerBtnClicked:(()->())?
    var trackBtnClicked:(()->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setIntialData()
    }

    private func setIntialData() {
        self.regiterButton.layer.cornerRadius = 9
    }
    
    @IBAction
    func btnRegisterClicked() {
        self.registerBtnClicked?()
    }

    @IBAction
    func btnTrackClicked() {
        self.trackBtnClicked?()
    }

}
