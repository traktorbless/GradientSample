//
//  ViewController.swift
//  Task1
//
//  Created by Anton Taranov on 01.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var rectangle: UIView = SquareView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(rectangle)
    }

    override func viewDidLayoutSubviews() {
        rectangle.setNeedsLayout()
    }

}

private final class SquareView: UIView {
    private enum Constants {
        static let size: CGFloat = 100
        static let leftIndent: CGFloat = 100
        static let cornerRadius: CGFloat = 15
        static let shadowRaduis: CGFloat = 10
        static let shadowColor = UIColor.black.cgColor
        static let shadowOpacity: Float = 0.4
        static let gradientColors = [UIColor.systemCyan.cgColor, UIColor.systemRed.cgColor]
        static let gradientLocations: [NSNumber] = [0, 0.85]
    }
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let superview else { return }
        let width = Constants.size
        let height = Constants.size
        let x = Constants.leftIndent
        let y = (superview.frame.height - height) / 2
        frame = .init(x: x, y: y, width: width, height: height)
        gradientLayer.frame = bounds
    }
    
    
    private func configureStyle() {
        gradientLayer.cornerRadius = Constants.cornerRadius
        configureShadow()
        configureGradient()
    }
    
    private func configureShadow() {
        gradientLayer.shadowColor = Constants.shadowColor
        gradientLayer.shadowRadius = Constants.shadowRaduis
        gradientLayer.shadowOpacity = Constants.shadowOpacity
        gradientLayer.shadowOffset = .init(width: 0, height: Constants.shadowRaduis)
    }
    
    private func configureGradient() {
        gradientLayer.startPoint = .zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = Constants.gradientColors
        gradientLayer.locations = Constants.gradientLocations

        layer.addSublayer(gradientLayer)
    }
}

