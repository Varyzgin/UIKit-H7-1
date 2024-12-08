//
//  MoreViewController.swift
//  UIKit-HW7-1
//
//  Created by Дима on 12/8/24.
//

import UIKit

class DetailsViewController: UIViewController {
    func setupPage(content: Content) {
        imageView.image = UIImage(named: content.posterImage)
        authorLabel.text = content.authorText
        dateLabel.text = content.dateText
        descriptionLabel.text = content.postText
    }
    lazy var contentView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubviews(imageView, stackView, descriptionLabel)
        return $0
    }(UIView())
    
    lazy var imageView = {
        $0.layer.cornerRadius = 20
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    lazy var authorLabel = setupLabel(textStyle: .megaHeader)
    lazy var dateLabel =  setupLabel(textStyle: .description)
    lazy var stackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.addArrangedSubview(authorLabel)
        $0.addArrangedSubview(dateLabel)
        return $0
    }(UIStackView())
    lazy var descriptionLabel = setupLabel(textStyle: .description)
    
    lazy var scrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.alwaysBounceVertical = true // для того чтобы убрать отступ сверху
        $0.contentInsetAdjustmentBehavior = .never
        $0.backgroundColor = .white
        $0.addSubview(contentView)
        return $0
    }(UIScrollView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(scrollView)
        setupConstraints()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  3 * Margins.large.value()),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margins.large.value()),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margins.large.value()),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 9/16),
            
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Margins.large.value()),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margins.large.value()),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margins.large.value()),
            
            descriptionLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: Margins.large.value()),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margins.large.value()),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margins.large.value()),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Margins.large.value())
        ])
    }
}
