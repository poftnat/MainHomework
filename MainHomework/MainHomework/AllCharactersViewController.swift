//
//  ViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 11.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    
    var characters: [Hero] = []
    
    let networkLoader = CharactersLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loader()
    }
    
    func loader() {
        networkLoader.loadCharacters { [weak self] (result) in
            guard let self = self else { return }
            self.characters = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        print(characters.count)
    }
        
    func setupCollectionView() {
        layout = setupFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .green
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        collectionView.dataSource = self
        
        collectionView.register(AllCharactersViewCell.self, forCellWithReuseIdentifier: "\(AllCharactersViewCell.self)")
        collectionView.backgroundColor = .systemIndigo
        
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout { //функция для создания лэйаут (разметки) для коллекции
        let layout = UICollectionViewFlowLayout()
        
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        layout.sectionInset = .init(top: 10, left: 30, bottom: 30, right: 30)
        layout.itemSize = .init(width: view.frame.size.width - 16, height: 100)

        return layout
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AllCharactersViewCell.self)", for: indexPath) as? AllCharactersViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(result: characters[indexPath.row])
        
        return cell
    }
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var id = characters[indexPath.row].id
        networkLoader.getCharacterData(id: id ?? 0) { (result) in
            print(result)
        }
        
    }
}
