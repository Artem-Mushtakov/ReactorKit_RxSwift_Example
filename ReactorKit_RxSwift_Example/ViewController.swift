//
//  ViewController.swift
//  ReactorKit_RxSwift_Example
//
//  Created by Артем on 24.12.2021.
//

import UIKit


class ViewController: UIViewController {

    // MARK: - Propirties

    private lazy var carButton: UIButton = {
        let carButton = UIButton(type: UIButton.ButtonType.system)
        carButton.setTitle("Car", for: .normal)
        return carButton
    }()

    private lazy var planeButton: UIButton = {
        let planeButton = UIButton(type: UIButton.ButtonType.system)
        planeButton.setTitle("Plane", for: .normal)
        return planeButton
    }()

    private lazy var shipButton: UIButton = {
        let shipButton = UIButton(type: UIButton.ButtonType.system)
        shipButton.setTitle("Ship", for: .normal)
        return shipButton
    }()

    private lazy var selectedLabel: UILabel = {
        let selectedLabel = UILabel()
        selectedLabel.text = "Transport"
        return selectedLabel
    } ()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [carButton,
                                                       planeButton,
                                                       shipButton,
                                                       selectedLabel])
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    } ()

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        setupLayout()
    }

    // MARK: - Configures

    func configureUI() {
        view.backgroundColor = .lightGray
    }

    // MARK: - Setup Layout

    func setupLayout() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }


}

