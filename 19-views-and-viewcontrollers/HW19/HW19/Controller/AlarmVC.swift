//
//  AlarmVCCollectionViewController.swift
//  HW19
//
//  Created by Petro Golishevskiy on 26.05.2021.
//

import UIKit

private let reuseIdentifier = "cell"

class AlarmVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var array = [Alarm(time: "7:00", description: "Робота"),
                 Alarm(time: "22:00", description: "Зустрітися з другом")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemGray5
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AlarmCell
        
        cell.setup(time: array[indexPath.item].time,
                   description: array[indexPath.item].description)
        cell.backgroundColor = .black
        return cell
    }
}
