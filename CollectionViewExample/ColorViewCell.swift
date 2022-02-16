//
//  ColorViewCell.swift
//  CollectionViewExample
//
//  Created by Taehoon Kim on 2022/02/16.
//

import UIKit

class ColorViewCell: UICollectionViewCell {
    // MARK: - Properties
    
    // Controller에게서 전달 받을 colorCode
    var colorCode: Int? {
        didSet {
            configureUI()
        }
    }
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Helper
    
    // ColorCode가 변경되면, Cell의 background 색을 변경함
    func configureUI() {
        guard let colorCode = colorCode else {
            return
        }
        backgroundColor = UIColor(rgb: colorCode)
    }
}
