//
//  PiecePageViewController.swift
//  kutyakevero
//
//  Created by Adam Horvath on 2017. 12. 18..
//  Copyright © 2017. Adam Horvath. All rights reserved.
//

import UIKit

class PiecePageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var bodyPiece: BodyPiece = .eye {
        didSet {
            updatePages()
        }
    }
    private var pageViewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.updatePages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func updatePages() {
        let images = bodyPiece.getImages()
        var viewControllers:  [UIViewController] = []
        for image in images {
            let pieceViewController = PieceViewController()
            pieceViewController.image = UIImage(named: image)
            viewControllers.append(pieceViewController)
        }
        self.pageViewControllers = viewControllers
        if let firstViewController = pageViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let presentedIndex = pageViewControllers.index(of: viewController) else { return nil }
        if presentedIndex == 0 {
            return nil
        }
        return pageViewControllers[presentedIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let presentedIndex = pageViewControllers.index(of: viewController)  else { return nil }
        if presentedIndex >= pageViewControllers.count - 1 {
            return nil
        }
        return pageViewControllers[presentedIndex + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = pageViewControllers.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }

}
