//
//  PiecePageViewController.swift
//  kutyakevero
//
//  Created by Adam Horvath on 2017. 12. 18..
//

import UIKit

class PiecePageViewController: UIPageViewController {
    
    var bodyPiece: BodyPiece = .ear {
        didSet {
            updatePages()
        }
    }
    private var presentedIndex = 0
    private var pageViewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        self.updatePages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showNextItem() {
        if presentedIndex < pageViewControllers.count - 2 {
            presentedIndex += 1
        } else {
            presentedIndex = 0
        }
        setViewControllers([pageViewControllers[presentedIndex]], direction: .forward, animated: true)
    }
    
    func showPreviousItem() {
        if presentedIndex > 0 {
            presentedIndex -= 1
        } else {
            presentedIndex = pageViewControllers.count - 1
        }
        setViewControllers([pageViewControllers[presentedIndex]], direction: .reverse, animated: true)
    }
    
    func showItem(at index: Int) {
        if index >= pageViewControllers.count {
            return
        }
        presentedIndex = index
        setViewControllers([pageViewControllers[presentedIndex]], direction: .forward, animated: false)
    }
    
    private func updatePages() {
        let images = bodyPiece.getImages()
        var viewControllers:  [UIViewController] = []
        for image in images {
            let pieceViewController = PieceViewController()
            pieceViewController.image = UIImage(named: image + "_thumb")
            viewControllers.append(pieceViewController)
        }
        self.pageViewControllers = viewControllers
        if let firstViewController = pageViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}

// MARK: - UIPageViewControllerDelegate
extension PiecePageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewController = viewControllers?.first, let index = pageViewControllers.index(of: viewController) else { return }
        presentedIndex = index
    }

}

// MARK: - UIPageViewControllerDataSource
extension PiecePageViewController: UIPageViewControllerDataSource {
    
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
    
    
}
