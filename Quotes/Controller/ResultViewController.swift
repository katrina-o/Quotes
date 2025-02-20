//
//  ResultViewController.swift
//  Quotes
//
//  Created by Катя on 07.10.2024.
//
import UIKit
import SnapKit


class ResultViewController: UIViewController {
    
    
    var quoteLabel: UILabel = {
        let label = UILabel()
        return label
        
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .right
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
