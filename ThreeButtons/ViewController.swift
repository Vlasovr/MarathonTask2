import UIKit

final class ViewController: UIViewController {
    private lazy var firstButton = AdaptiveButton(title: "First Button")
    private lazy var secondButton = AdaptiveButton(title: "Second Medium Button")
    private lazy var thirdButton = {
        var button = AdaptiveButton(title: "Third")
        button.addTarget(self, action: #selector(self.showModalVC), for: .touchUpInside)
        return button
    }
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.addArrangedSubview(firstButton)
        stack.addArrangedSubview(secondButton)
        stack.addArrangedSubview(thirdButton())
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(stackView)
        setupStackViewConstraints()
    }
    
    private func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func showModalVC() {
        let modalVC = UIViewController()
        modalVC.view.backgroundColor = .white
        self.present(modalVC, animated: true)
        
    }
}
