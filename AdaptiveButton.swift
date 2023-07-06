import UIKit

final class AdaptiveButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        configureButton()
        self.setTitle(title, for: .normal)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func configureButton() {
        self.backgroundColor = .systemBlue
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 8
        
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePadding = 8
        configuration.imagePlacement = .trailing
        self.configuration = configuration
        
        self.addTarget(self, action: #selector(touchDown), for: .touchDown)
        self.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)

    }
    
    @objc func touchDown() {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState]) {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
    @objc func touchUpInside() {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState]) {
            self.transform = .identity
        }
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        
        switch tintAdjustmentMode {
        case .dimmed:
            self.backgroundColor = .systemGray2
            self.tintColor = .systemGray3
        default:
            self.backgroundColor = .systemBlue
            self.tintColor = .systemBlue
        }
    }
}
