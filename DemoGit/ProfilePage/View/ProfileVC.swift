//
//  ProfileVC.swift
//  DemoGit
//
//  Created by Pradeep Kumar on 11/06/21.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var btnUser: UIButton!
    @IBOutlet private var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet private var uploadView: UIView!
    @IBOutlet private var artWorkView: UIView!
    @IBOutlet private var exhibitionView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib.init(nibName: "ImageViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageViewCell")
        btnUser.layer.cornerRadius = 22
        collectionViewHeight.constant = 10*170 + 90
    }
    
    
    @IBAction
    func tapOnOption(_ tapGesture: UITapGestureRecognizer) {
        if let tag = tapGesture.view?.tag {
            uploadView.backgroundColor = .white
            exhibitionView.backgroundColor = .white
            artWorkView.backgroundColor = .white
            switch tag {
            case 100:
                uploadView.backgroundColor = .systemYellow
            case 200:
                exhibitionView.backgroundColor = .systemYellow
            default:
                artWorkView.backgroundColor = .systemYellow
            }
        }
    }
}


extension ProfileVC: UICollectionViewDelegate,
                     UICollectionViewDataSource,
                     UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageViewCell", for: indexPath) as? ImageViewCell
        return imageCell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (screenWidth - 40 - 10) / 2  , height: 170)
    }
    
}
