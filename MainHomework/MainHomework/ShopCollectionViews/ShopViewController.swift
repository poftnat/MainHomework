//
//  ViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 11.11.2023.
//

import UIKit

final class ShopViewController: UIViewController, UISearchBarDelegate {
    
    private var collectionView: UICollectionView!
    private var layout: UICollectionViewFlowLayout!
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.delegate = self
        searchBar.frame = CGRect(x: 0, y: 70, width: view.frame.size.width, height: 40)
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search Here....."
        searchBar.sizeToFit()
        return searchBar
    }()
    
    private var source: [Source] = [Source(image: "planet1",
                                   recentPrice: "59,99\u{20bd}",
                                   currentPrice: "39,99\u{20bd}",
                                   description: "Saturn",
                                   saleLabel: "20%"),
                            Source(image: "planet3",
                                   recentPrice: "29,99\u{20bd}",
                                   currentPrice: "15,99\u{20bd}",
                                   description: "Neptune",
                                   saleLabel: "20%"),
                            Source(image: "planet4",
                                   recentPrice: "18,99\u{20bd}",
                                   currentPrice: "13.89\u{20bd}",
                                   description: "Uranus",
                                   saleLabel: "15%"),
                            Source(image: "planet5",
                                   recentPrice: "139,99\u{20bd}",
                                   currentPrice: "109,99\u{20bd}",
                                   description: "Alfa Centauri 3",
                                   saleLabel: "25%"),
                            Source(image: "planet6",
                                   recentPrice: "49,99\u{20bd}",
                                   currentPrice: "39,99\u{20bd}",
                                   description: "Orion",
                                   saleLabel: "25%"),
                            Source(image: "planet7",
                                   recentPrice: "109,99\u{20bd}",
                                   currentPrice: "99,99\u{20bd}",
                                   description: "Sedna",
                                   saleLabel: "20%")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        self.title = "Скидки"
        layout = setupFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        collectionView.dataSource = self
        collectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: "\(ShopCollectionViewCell.self)")
        collectionView.backgroundColor = .white
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = .init(width: 160, height: 320)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = .init(top: 20, left: 20, bottom: 30, right: 20)
        
        return layout
    }
}

extension ShopViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ShopCollectionViewCell.self)", for: indexPath) as? ShopCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(source: source[indexPath.row])
        return cell
        
    }
}
