//
//  HomeViewController.swift
//  NavigationExample
//
//  Created by Ferhat Taşlı on 20.11.2024.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    
    var collectionView : UICollectionView?
    
    
    
    let icons: [Icon] = [
        Icon(image: UIImage(systemName: "star.fill")!, title: "Star"),
        Icon(image: UIImage(systemName: "heart.fill")!, title: "Heart"),
        Icon(image: UIImage(systemName: "bell.fill")!, title: "Bell"),
        Icon(image: UIImage(systemName: "gear")!, title: "Settings"),
        Icon(image: UIImage(systemName: "star.fill")!, title: "Star"),
        Icon(image: UIImage(systemName: "heart.fill")!, title: "Heart"),
        Icon(image: UIImage(systemName: "bell.fill")!, title: "Bell"),
        Icon(image: UIImage(systemName: "gear")!, title: "Settings"),
        Icon(image: UIImage(systemName: "star.fill")!, title: "Star"),
        Icon(image: UIImage(systemName: "heart.fill")!, title: "Heart"),
        Icon(image: UIImage(systemName: "bell.fill")!, title: "Bell"),
        Icon(image: UIImage(systemName: "gear")!, title: "Settings"),
        // Add more icons
        // Add more icons
    ]
        

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width / 3 - 10 , height: view.frame.height / 4 - 20)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(IconCell.self, forCellWithReuseIdentifier: "IconCell")
        view.addSubview(collectionView!)
        
        guard let collectionView = collectionView else { return }
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Do any additional setup after loading the view.
    }
    
   
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCell", for: indexPath) as! IconCell
        let icon = icons[indexPath.row]
        cell.configure(with: icon)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = NextViewController()
        detailVC.icon = icons[indexPath.item].image
        detailVC.titleText = icons[indexPath.item].title
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
