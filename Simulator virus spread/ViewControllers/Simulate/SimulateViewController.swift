//
//  SimulateViewController.swift
//  Simulator virus spread
//
//  Created by Vlad Ralovich on 07.05.2023.
//

import UIKit

class SimulateViewController: UIViewController {
    
    private var model: [Int] = []
    private var zoomView: ZoomCollectionView?
    
    //MARK: - Life Cycle
    init(coutn: Int) {
        super.init(nibName: nil, bundle: nil)
        for i in 0...coutn {
            model.append(i)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Симулятор"
        createZoomCollectionView()
        setupUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_ : )))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.delegate = self
        self.zoomView!.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func handleTap(_ recognizer: UIGestureRecognizer) {
        print(recognizer.location(in: zoomView!))
        guard let index = zoomView!.collectionView.indexPathForItem(at: recognizer.location(in: zoomView!.collectionView)) else { return }
        guard let cell = zoomView!.collectionView.cellForItem(at: index) else { return }
       
        if cell.isSelected {
            zoomView!.collectionView.deselectItem(at: index, animated: true)
        } else {
            zoomView!.collectionView.selectItem(at: index, animated: true, scrollPosition: [.centeredHorizontally, .centeredVertically])
        }
        
    }
    
    //MARK: - Private
    private func createZoomCollectionView() {
        let itemWidth = (self.view.frame.width - 20.0)/10.0
        let layout = ScalingGridLayout(
            itemSize: CGSize(width: itemWidth, height: itemWidth),
            columns: 31,
            itemSpacing: 5.0,
            scale: 1.0
        )
        
        zoomView = ZoomCollectionView(
            frame: CGRect(origin: .zero, size: self.view.frame.size),
            layout: layout,
            delegate: self
        )
        guard let zoomView = zoomView else  { return }
        zoomView.collectionView.dataSource = self
        zoomView.collectionView.register(HumanCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        zoomView.collectionView.backgroundColor = .gray
        zoomView.scrollView.minimumZoomScale = 1.0
        zoomView.scrollView.zoomScale = 1.0
        zoomView.scrollView.maximumZoomScale = 4.0
    }
    
    private func setupUI() {
        guard let zoomView = zoomView else  { return }
        view.addSubview(zoomView)
//        zoomView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            zoomView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            zoomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            zoomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            zoomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//        ])
    }
}

//MARK: - UICollectionViewDataSource
extension SimulateViewController: UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HumanCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // cells might have been hidden by hideLingeringCells() so we must un-hide them.
        cell.isHidden = false
    }
}
