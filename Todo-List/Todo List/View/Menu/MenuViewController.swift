//
//  MenuViewController.swift
//  Todo List
//
//  Created by Junior Fernandes on 28/01/21.
//

import UIKit

class MenuViewController: UIViewController {
    lazy var profileImage: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "SecondColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.masksToBounds = true

        return view
    }()

    lazy var userName: UITextField = {
        var text = UITextField(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .right
        text.borderStyle = .none
        text.textColor = .white
        text.font = UIFont.systemFont(ofSize: 31, weight: .bold)
        text.text = "Junior Fernandes"
        return text
    }()

    fileprivate lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "PrimaryColor")

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(profileImage)
        self.view.addSubview(headerView)
        self.view.addSubview(userName)
        view.layer.backgroundColor = UIColor(named: "PrimaryColor")?.cgColor
        self.setupView()
    }

    func setupView() {
        //Image profile
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            profileImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            profileImage.heightAnchor.constraint(equalToConstant: 113),
            profileImage.widthAnchor.constraint(equalToConstant: 113)
        ])

        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: profileImage.bottomAnchor),
            userName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            userName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
        ])



        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 100),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

      ])
    }

}
