//
//  HomeViewController.swift
//  Todo List
//
//  Created by Junior Fernandes on 28/01/21.
//

import SideMenu
import UIKit

class HomeViewController: UIViewController {
    let vc = MenuViewController()
    var sideMenu: SideMenuNavigationController

    required init?(coder: NSCoder) {
        self.sideMenu = SideMenuNavigationController(rootViewController: vc)
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        vc.delegate = self
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

extension HomeViewController: Logout {
    func logout() {
        dismiss(animated: true, completion: nil)
    }
}
