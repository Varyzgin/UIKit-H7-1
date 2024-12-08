//
//  CardCellView.swift
//  UIKit-HW7-1
//
//  Created by Дима on 12/5/24.
//

import UIKit

class CardCellView: UITableViewCell {
    static let identifier: String = "CardCellView"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cardView)
    }
    lazy var cardView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        $0.layer.cornerRadius = 20
        $0.addSubviews(posterImageView, authorTextLabel, descriptionTextLabel, stackView, detailsButton) // !!!
        return $0
    }(UIView())
    
    func setupCell(content: Content) {
        posterImageView.image = UIImage(named: content.posterImage)
        authorTextLabel.text = content.authorText
        descriptionTextLabel.text = content.previewText

        content.imagesStack.forEach {
            if let image = UIImage(named: $0) {
                let imageView = UIImageView(image: image)
                imageView.layer.cornerRadius = 15
                imageView.clipsToBounds = true
                stackView.addArrangedSubview(imageView)
            }
        }
        setupConstraints()
    }
    
    lazy var posterImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
//        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        $0.layer.masksToBounds = true
        return $0
    }(UIImageView())

    lazy var authorTextLabel = setupLabel(textStyle: .megaHeader, textColor: .white)
    lazy var descriptionTextLabel = setupLabel(textStyle: .subDescription, textColor: .white)
    lazy var stackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = Margins.small.value()
//        $0.addArrangedSubview(authorTextLabel)
//        $0.addArrangedSubview(descriptionTextLabel)
        return $0
    }(UIStackView())
    
    lazy var detailsButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Details", for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 20
        $0.setTitleColor(.white, for: .normal)
        return $0
    }(UIButton())

    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Margins.small.value()),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margins.large.value()),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margins.large.value()),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Margins.small.value()),
            
            posterImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: Margins.small.value()),
            posterImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Margins.small.value()),
            posterImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Margins.small.value()),
            posterImageView.heightAnchor.constraint(equalTo: posterImageView.widthAnchor, multiplier: 9/16),
            
            descriptionTextLabel.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: -Margins.medium.value()),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: Margins.medium.value()),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: -Margins.medium.value()),
            
            authorTextLabel.bottomAnchor.constraint(equalTo: descriptionTextLabel.topAnchor, constant: -Margins.small.value()),
            authorTextLabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: Margins.medium.value()),
            authorTextLabel.trailingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: -Margins.medium.value()),
            
            stackView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: Margins.small.value()),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Margins.small.value()),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Margins.small.value()),
            stackView.heightAnchor.constraint(equalTo:  stackView.widthAnchor, multiplier: 1/3),

            detailsButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: Margins.large.value()),
            detailsButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: Margins.large.value()),
            detailsButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -Margins.large.value()),
            detailsButton.heightAnchor.constraint(equalToConstant: 2 * Margins.large.value()),
            detailsButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -Margins.large.value()),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
