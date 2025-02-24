//
//  ViewController.swift
//  Quotes
//
//  Created by Катя on 07.10.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController,UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    var quotesManager = QuotesManager()
    var quotesCell = QuotesCell()
    var quotes: [QuotesData]?
    let categoryArray = ["happiness", "age", "alone", "dreams", "food"]
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Enter your request"
        return searchBar
    }()
    
    var quotesTableView: UITableView = {
        let tableView = UITableView()
        tableView.autoresizingMask = .flexibleHeight
        tableView.autoresizingMask = .flexibleWidth
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        createTable()
        quotesManager.getCategoryQuotes { response in
            self.quotes = response
            
            DispatchQueue.main.async {
                self.quotesTableView.reloadData()
            }
        }
        
    }

    func createTable() {
        self.quotesTableView.register(QuotesCell.self, forCellReuseIdentifier: QuotesCell.identifire)
        quotesTableView.delegate = self
        quotesTableView.dataSource = self
    }
    func initialize() {
        view.backgroundColor = .systemBackground
        view.addSubview(searchBar)
        view.addSubview(quotesTableView)
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        quotesTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar).offset(70)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    //MARK: UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange category: String) {
        print(category)
        
        }
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return quotes?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuotesCell.identifire, for: indexPath) as? QuotesCell else {
            fatalError("Fatal error")
        }
        let indexpathQuotes = quotes?[indexPath.row].quote ?? ""
        cell.configure(quotesLabel: indexpathQuotes)
        
        return cell
    }
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return/* UITableView.automaticDimension*/ 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = ResultViewController()
        navigationController?.pushViewController(secondVC, animated: true)
//        let indexPathQuote = quotes?[indexPath.row].quote
    }
    
}

