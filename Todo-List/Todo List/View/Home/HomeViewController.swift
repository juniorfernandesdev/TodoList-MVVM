//
//  HomeViewController.swift
//  Todo List
//
//  Created by Junior Fernandes on 28/01/21.
//

import SideMenu
import UIKit

class HomeViewController: UIViewController {
    let sideMenu = SideMenuNavigationController(rootViewController: MenuViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.leftSide = true
        sideMenu.presentationStyle = .menuSlideIn
        sideMenu.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
    @IBAction func didTapMenuButton(_ sender: UIButton) {
        self.present(sideMenu, animated: true)
    }

}
