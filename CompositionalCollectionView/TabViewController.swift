//
//  TabmanViewController.swift
//  CompositionalCollectionView
//
//  Created by OpenObject on 2023/02/10.
//

import Foundation
import Tabman
import Pageboy

class TabViewController: TabmanViewController {
  private var viewControllers: [UIViewController] = []
  @IBOutlet weak var barView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let secondVc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    let thirdVc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
    
    viewControllers.append(secondVc)
    viewControllers.append(thirdVc)
    self.dataSource = self
    
    let bar = TMBar.ButtonBar()
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    bar.layout.transitionStyle = .snap
    bar.layout.contentMode = .fit
    bar.backgroundView.style = .blur(style: .light)
    bar.buttons.customize { button in
      button.tintColor = .systemGray4
      button.selectedTintColor = .black
      button.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
      button.selectedFont = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    bar.indicator.weight = .custom(value: 2)
    bar.indicator.tintColor = .black
    
    addBar(bar, dataSource: self, at: .custom(view: barView, layout: nil))

  }
}

extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource {
  // MARK: - PageboyViewControllerDataSource
  func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
    return viewControllers.count
  }
  
  func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
    return viewControllers[index]
  }
  
  func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
    return nil
  }
  
  // MARK: - TMBarDataSource
  func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
    let item = TMBarItem(title: "")
    item.title = "Page \(index)"
//    item.image = UIImage(named: "image.png")
    
    return item
  }
  
}
