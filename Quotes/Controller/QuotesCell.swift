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
            make.center.equalTo(contentView)
        }    
    }
}
