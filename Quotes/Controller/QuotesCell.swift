//
//  QuotesCell.swift
//  Quotes
//
//  Created by Катя on 09.10.2024.
//
import UIKit
import SnapKit


class QuotesCell: UITableViewCell {
    
    static let identifire = "CustomCell"
    
    let quotesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 5
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(quotesLabel: String) {
        self.quotesLabel.text = quotesLabel
    }
    
    func setupUI () {
        self.contentView.addSubview(quotesLabel)
        
        quotesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.center.equalToSuperview()
        }
    }
}
