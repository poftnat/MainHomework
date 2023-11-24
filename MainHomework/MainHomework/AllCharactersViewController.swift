//
//  ViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 11.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
   private var collectionView: UICollectionView!
    
   private var layout: UICollectionViewFlowLayout!
    
   private var characters: [Hero] = []
    
   private let networkLoader = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loader()
    }
    
   private func loader() {
        networkLoader.loadCharacters { [weak self] (result) in
            guard let self = self else { return }
            self.characters = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
   private func setupCollectionView() {
        layout = setupFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .black
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(red: 0.184, green: 0.184, blue: 0.184, alpha: 1.00)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(AllCharactersCollectionViewCell.self, forCellWithReuseIdentifier: "\(AllCharactersCollectionViewCell.self)")
    }
    
   private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = .init(width: 350, height: 150)
        return layout
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AllCharactersCollectionViewCell.self)", for: indexPath) as? AllCharactersCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(result: characters[indexPath.row])
        return cell
    }
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var id = characters[indexPath.row].id
        networkLoader.getCharacterData(id: id ?? 0) { [weak self] (result) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                let oneCharacterVC = CharacterViewController(hero: result)
                self.navigationController?.pushViewController(oneCharacterVC, animated: true)
            }
        }
    }
}
