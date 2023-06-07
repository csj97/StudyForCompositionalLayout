//
//  MyCell.swift
//  CompositionalCollectionView
//
//  Created by OpenObject on 2023/02/08.
//

import Foundation
import UIKit

class MyCell: UICollectionViewCell {

  @IBOutlet weak var labelText: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    setUI()
  }
  
  func setUI() {
    self.contentView.backgroundColor = UIColor(
      red: CGFloat(drand48()),
      green: CGFloat(drand48()),
      blue: CGFloat(drand48()),
      alpha: 1.0
    )
  }
}
