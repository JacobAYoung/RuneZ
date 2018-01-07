//
//  ViewControllerFuncs.swift
//  OSRS_Guides
//
//  Created by Zach Galloway on 1/7/18.
//  Copyright © 2018 Jake Young. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
  //sets back navigation button to runescape font
  func setRunescapeBackButtonFont() {
    
    //removes grey line just below navigation bar
    navigationController?.navigationBar.shadowImage = UIImage()
    
    let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: nil)
    backButton.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Runescape UF", size: 24)!], for: [])
    navigationItem.backBarButtonItem = backButton
  }
}
