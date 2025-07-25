//
//  ReaderViewController.swift
//  ReaderApp
//
//  Created by Normsoftware on 7/23/25.
//

import UIKit

class ProductViewController: UIViewController {
    private let mainView = ProductView()
    private let viewModel = ProductViewModel()
    
    let refreshControl = UIRefreshControl()


    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Products"
        mainView.tableView.backgroundColor = .systemBackground
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.searchBar.delegate = self
        
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]

        
        
        // Setup Pull-to-Refresh
        setupRefreshControl()

           //    refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
             //  refreshControl.addTarget(self, action: #selector(refreshProductList), for: .valueChanged)
        mainView.tableView.refreshControl = refreshControl

        fetchProducts()
    }
    
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            // Handle appearance change if needed
            mainView.tableView.reloadData()  // for example
        }
    }


    

    // MARK: - Pull-to-Refresh Action
    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        mainView.tableView.refreshControl = refreshControl
    }

    @objc private func refreshData() {
        fetchProducts()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.mainView.tableView.refreshControl?.endRefreshing()
            }
    }

    
    
    private func fetchProducts() {
        viewModel.fetchProducts { [weak self] in
            DispatchQueue.main.async {
                self?.mainView.tableView.reloadData()
            }
        }
    }
}

extension ProductViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        let product = viewModel.filteredProducts[indexPath.row]
        cell.configure(with: product)
        return cell
    }
}

extension ProductViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterProducts(with: searchText)
        mainView.tableView.reloadData()
    }
}
