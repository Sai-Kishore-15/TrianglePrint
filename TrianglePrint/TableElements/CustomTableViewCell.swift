//
//  CustomTableViewCell.swift
//  TrianglePrint
//
//  Created by Sai Kishore on 04/04/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var collectionView: UICollectionView!
    
    static let identifier: String = "CustomTableViewCell"
    
    var models = [CollectionModel]()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configure(with collectionModels: [CollectionModel]){
        
        self.models = collectionModels
        collectionView.reloadData()
    }
        
    static func nib() -> UINib {
        
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
}


extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
}
