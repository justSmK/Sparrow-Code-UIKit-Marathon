//
//  MainViewController.swift
//  UIKit Marathon
//
//  Created by Sergei Semko on 5/21/23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let widthWindowScene = UIScreen.main.bounds.width - 10
        static let heightWindowScene = UIScreen.main.bounds.height - 500
    }

    // MARK: - Private properties
    
    private var tasks = Tasks()
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewFlowLayout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
//        collectionView.backgroundColor = .systemBackground
//        collectionViewFlowLayout.scrollDirection = .vertical
        collectionView.register(
            MainCollectionViewCell.self,
            forCellWithReuseIdentifier: MainCollectionViewCell.identifier
        )
        
//        collectionViewFlowLayout.minimumLineSpacing = 100
        
        return collectionView
    }()
    
    // MARK: - Initializers
    
//    init(tasks: Tasks) {
//        self.tasks = tasks
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        setupCollectionViewLayout()
        setupDelegates()
        setupTasks()
    }
    

    // MARK: - Private methods
    
    private func setupTasks() {
        var arrayOfNames = [String]()
        
        // FIXME: Change count of files
//        #warning("Write count of files")
        for i in 1...9 {
            let fileName = "Task\(i)Text"
            arrayOfNames.append(fileName)
        }
        
        for name in arrayOfNames {
            guard let file = Bundle.main.url(forResource: name, withExtension: "txt") else {
                fatalError("Couldn't find \(name) in main bundle")
            }
            
            do {
                let contents = try String(contentsOf: file, encoding: .utf8)
                
                let splitContent = contents.split(separator: "#")
                let title = splitContent.first
                let text = splitContent.last
                if let title, let text {
                    let task = Task(title: String(title), text: String(text))
                    tasks.append(task)
                }
            } catch {
                print("Error reading")
            }
        }
    }
    
    private func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupCollectionViewLayout() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainCollectionViewCell.identifier,
            for: indexPath
        ) as! MainCollectionViewCell
        let model = tasks[indexPath.row]
        cell.setupViewCell(title: model.title, text: model.text)
        return cell
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let width = view.window?.windowScene?.screen.bounds.width,
              let height = view.window?.windowScene?.screen.bounds.height
        else {
            return .zero
        }
        
        
        switch indexPath.item {
        case 0:
            return CGSize(width: width, height: height / 2)
        case 1:
            return CGSize(width: width, height: height / 2)
        default:
            return CGSize(width: width, height: height / 2)
        }
    }
}
