//
//  ColorViewCell.swift
//  CollectionViewExample
//
//  Created by Taehoon Kim on 2022/02/16.
//

import UIKit

class ColorViewCell: UICollectionViewCell {
    // MARK: - Properties
    
    var colorView: UIImageView = {
       let iv = UIImageView()
        iv.clipsToBounds = true
        return iv
    }()
    
    // Controller에게서 전달 받을 colorCode
    var colorCode: Int? {
        didSet {
            configureUI()
        }
    }
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        colorView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        colorView.layer.cornerRadius = frame.width / 2
        addSubview(colorView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Helper
    override var isSelected: Bool {
        didSet {
            configureUI()
        }
    }
    
    // ColorCode가 변경되면, Cell의 background 색을 변경함
    func configureUI() {
        guard let colorCode = colorCode else {
            return
        }
      
        // 선택한 경우
        if isSelected {
            colorView.image = UIImage(named: "color_pick")?.withRenderingMode(.alwaysTemplate)
            colorView.tintColor = UIColor(rgb: colorCode)
            colorView.backgroundColor = .white
        }
        // 선택하지 않은 경우
        else {
            colorView.tintColor = .clear
            colorView.backgroundColor = UIColor(rgb: colorCode)
        }
    }
}
