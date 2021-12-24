//
//  TransportViewController.swift
//  ReactorKit_RxSwift_Example
//
//  Created by Артем on 24.12.2021.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class TransportViewController: UIViewController {

    // MARK: - Properties

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

        bind(reactor: reactorTransport)
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

    var disposeBag = DisposeBag()

    let reactorTransport = TransportReactor()

    func bind(reactor: TransportReactor) {

        carButton.rx.tap
            .map{ TransportReactor.Action.car }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)


        planeButton.rx.tap
            .map{ TransportReactor.Action.plane }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        shipButton.rx.tap
            .map{ TransportReactor.Action.ship }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        reactor.state.map { $0.textTransport }
        .distinctUntilChanged()
        .map { $0 }
        .subscribe(onNext: { text in
            self.selectedLabel.text = text
        })
        .disposed(by: disposeBag)

        reactor.state.map { $0.isLoading }
        .distinctUntilChanged()
        .subscribe(onNext: { text in
            if text == true{
                self.selectedLabel.text = "Включена задержка"
            }
        })
        .disposed(by: disposeBag)
    }
}
