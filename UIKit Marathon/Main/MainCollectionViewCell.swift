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
//        label.isHighlighted = true
//        label.highlightedTextColor = .brown
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelContent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
//        label.font = .monospacedDigitSystemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
//        label.textAlignment = .natural
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
            labelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            labelTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            labelTitle.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
            labelTitle.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        contentView.addSubview(labelContent)
        NSLayoutConstraint.activate([
            labelContent.topAnchor.constraint(equalTo: labelTitle.bottomAnchor),
            labelContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            labelContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            labelContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            labelContent.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    // MARK: - Public methods
    
    public func setupViewCell(title: String, text: String) {
        labelTitle.text = title
        labelContent.text = text
    }
}
