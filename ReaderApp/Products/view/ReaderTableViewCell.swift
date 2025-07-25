//
//  ReaderTableViewCell.swift
//  ReaderApp
//
//  Created by Normsoftware on 7/23/25.
//

import UIKit


class ProductTableViewCell: UITableViewCell {
    static let identifier = "ProductTableViewCell"

    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private var brandLabel = UILabel()
    private var ImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = .systemBackground
    }


    private func setupUI() {
        
        
        titleLabel.textColor = .label
        priceLabel.textColor = .secondaryLabel
        brandLabel.textColor = .secondaryLabel
        contentView.backgroundColor = .systemBackground
        
    

        let stackView = UIStackView(arrangedSubviews: [titleLabel, priceLabel,brandLabel,ImageView])
        stackView.axis = .vertical
        stackView.spacing = 4

        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    func configure(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = "₹\(product.price)"
        brandLabel.text = product.brand ?? ""
        ImageView.image = UIImage(named:  product.thumbnail) ?? UIImage()
    }
}

