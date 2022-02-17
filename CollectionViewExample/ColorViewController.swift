//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by Taehoon Kim on 2022/02/16.
//

import UIKit

private let reuseIdentifier = "ColorViewCell"

class ColorViewController: UICollectionViewController {
    
    /// 보여줄 데이터
    let colorHexCodes = [0x000000,0xff3b30,0x007aff,0xff9500,0x4cd964,
                         0xEDCFA9,0xE89F72,0xFF935E,0xD5724A,0xAA4B31,
                         0xFCD1D1,0xECE2E,0xD3E0DC,0xAEE1E1,0xD9D7F1,
                         0x93B5C6,0xBCEBFD,0xC9CCD5,0xE4D8DC,0xFFE3E3,
                         0x535353,0x424242,0x323232,0x06405FA,0x032D44,
                         0xFEFFDE,0xDDFFBC,0x91C788,0x53744E,0x5D272D,
                         0x493535,0x6C5050,0xEED6C4,0xFFF3E4,0xFCF0C8,
                         0xC6D57F,0xD57F7F,0xA2CDCD,0xF4DFB3,0x3E2257]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ColorViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // 여러개 선택하기
        collectionView.allowsMultipleSelection = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 기본 선택 위치 설정
        let selectedIndexPath = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .left)
    }
}


// MARK: UICollectionViewDataSource
extension ColorViewController {
    
    /// cell 데이터가 몇 개인가
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorHexCodes.count
    }
    
    /// 각 Cell에 필요한 데이터를 설정한다.
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ColorViewCell
        
        cell.colorCode = colorHexCodes[indexPath.row]
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension ColorViewController {
    
    /// cell 데이터가 몇 개인가
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - UIColor
/// Hex Code Color을 사용하게 하는 함수
// let color = UIColor(rgb: 0xFFFFFF)
// let color = UIColor(rgb: 0xFFFFFF).withAlphaComponent(1.0)
// let color2 = UIColor(argb: 0xFFFFFFFF)
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
    
    convenience init(rgb: Int) {
        self.init(
            red:(rgb >> 16) & 0xFF,
            green:(rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    // let's suppose alpha is the first component (ARGB)
    
    convenience init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            a: (argb >> 24) & 0xFF
        )
    }
}
