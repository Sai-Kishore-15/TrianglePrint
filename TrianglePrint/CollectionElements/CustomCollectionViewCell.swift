//
//  CollectionTableViewCell.swift
//  TrianglePrint
//
//  Created by Sai Kishore on 04/04/21.
//

import Foundation
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet var myLabel: UILabel!
    
    static let identifier: String = "CustomCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
        
    static func nib() -> UINib {
        
        return UINib(nibName: "CustomCollectionViewCell", bundle: nil)
    }
    
    public func configure(with model: CollectionModel){
        
        self.myLabel.text = model.text
    }
}
