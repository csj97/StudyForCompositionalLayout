//
//  SecondViewController.swift
//  CompositionalCollectionView
//
//  Created by OpenObject on 2023/02/09.
//

import Foundation
import UIKit

enum MySection {
  case first([FirstItem])
  case second([SecondItem])
  
  struct FirstItem {
    let value: String
  }
  struct SecondItem {
    let value: String
  }
}


class SecondViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  private let data: [MySection] = [
      .first((1...30).map(String.init).map(MySection.FirstItem.init(value:))),
      .second((31...60).map(String.init).map(MySection.SecondItem.init(value:))),
    ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.collectionViewLayout = self.getLayout()
    collectionView.dataSource = self
    collectionView.register(UINib(nibName: "MyCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
    
  }
}

// MARK: - CollectionView
extension SecondViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    self.data.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch self.data[section] {
    case let .first(items):
      return items.count
    case let .second(items):
      return items.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? MyCell else {
        
        return UICollectionViewCell()
    }
    switch self.data[indexPath.section] {
    case let .first(items):
      cell.labelText.text = items[indexPath.row].value
    case let .second(items):
      cell.labelText.text = items[indexPath.row].value
    }
    
    return cell
  }
  
}

extension SecondViewController {
  func getLayout() -> UICollectionViewCompositionalLayout {
    UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
      switch section {
      case 0:
        let itemFractionalWidthFraction = 1.0 / 3.0 // horizontal 3개의 셀
        let groupFractionalHeightFraction = 1.0 / 4.0 // vertical 4개의 셀
        let itemInset: CGFloat = 2.5
        
        // Item
        let itemSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(itemFractionalWidthFraction),
          heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
        
        // Group
        let groupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .fractionalHeight(groupFractionalHeightFraction)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
        return section
        
      default:
        let itemFractionalWidthFraction = 1.0 / 5.0 // horizontal 5개의 셀
        let groupFractionalHeightFraction = 1.0 / 4.0 // vertical 4개의 셀
        let itemInset: CGFloat = 2.5
        
        // Item
        let itemSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(itemFractionalWidthFraction),
          heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
        
        // Group
        let groupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .fractionalHeight(groupFractionalHeightFraction)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
        return section
      }
    }
  }
}
