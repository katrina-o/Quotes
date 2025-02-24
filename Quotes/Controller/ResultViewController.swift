//
//  ResultViewController.swift
//  Quotes
//
//  Created by Катя on 07.10.2024.
//
import UIKit
import SnapKit


class ResultViewController: UIViewController {
    
    
    var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "HOME"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.numberOfLines = 5
        return label
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeConstraints()
    }
    
    func makeConstraints() {
        view.backgroundColor = .systemGreen
        view.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}

//extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
    

