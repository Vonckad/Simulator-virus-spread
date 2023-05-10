//
//  HumanCollectionViewCell.swift
//  Simulator virus spread
//
//  Created by Vlad Ralovich on 10.05.2023.
//

import UIKit

class HumanCollectionViewCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            print(isSelected)
            self.backgroundColor = isSelected ? .red : .green
        }
    }
}
