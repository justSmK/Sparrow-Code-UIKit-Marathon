//
//  MainCollectionViewCell.swift
//  UIKit Marathon
//
//  Created by Sergei Semko on 5/21/23.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    /// Converts the class name to a string
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - Private properties
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.isHighlighted = true
        label.highlightedTextColor = .brown
        
        return label
    }()
    
    private lazy var labelContent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .monospacedDigitSystemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.textAlignment = .natural
//        label.sizeToFit()
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupContentView() {
        contentView.backgroundColor = .cyan
    }
    
    private func setupLayout() {
        contentView.addSubview(labelTitle)
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            labelTitle.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            labelTitle.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
//            labelTitle.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        contentView.addSubview(labelContent)
        NSLayoutConstraint.activate([
            labelContent.topAnchor.constraint(equalTo: labelTitle.safeAreaLayoutGuide.bottomAnchor),
            labelContent.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            labelContent.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            labelContent.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Public methods
    
    public func setupViewCell(title: String, text: String) {
        labelTitle.text = title
        labelContent.text = text
    }
}
