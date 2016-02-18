//
//  IGVPageViewController.swift
//  IgvPeruApple
//
//  Created by Gonzalo on 17/02/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit

protocol IGVPageViewControllerDelegate{
    func pageViewController(pageViewController: UIPageViewController,didUpdatePageIndex index: Int)
}

class IGVPageViewController: UIPageViewController {
    //Variables
    var pages = ["calculadora","cronograma","historial"] //Storyboard ids
    var pageDelegate: IGVPageViewControllerDelegate? //Delegado


    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        setViewControllers([viewControllerAtIndex(0)!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }
    //Retorna VC con en el indice de pages
    func viewControllerAtIndex(index: Int) -> UIViewController?{
        let vc = storyboard?.instantiateViewControllerWithIdentifier(pages[index])
        return vc
    }
    //Notifica a el PVC que se ha cambiado de pagina
    func notifyDelegateOfNewIndex() {
        if let currentVC = viewControllers?.first,
            let index = pages.indexOf(currentVC.restorationIdentifier!){
                pageDelegate?.pageViewController(self, didUpdatePageIndex: index)
        }
    }

}
//MARK: - DataSource methods
extension IGVPageViewController: UIPageViewControllerDataSource{
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        guard let currentIndex = pages.indexOf(viewController.restorationIdentifier!) else {
            return nil
        }
        let previousIndex = currentIndex - 1
        guard previousIndex >= 0 else{
            return nil
        }
        guard pages.count > previousIndex else{
            return nil
        }
        return viewControllerAtIndex(previousIndex)
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        guard let currentIndex = pages.indexOf(viewController.restorationIdentifier!) else {
            return nil
        }
        let nextIndex = currentIndex + 1
        let pagesCount = pages.count
        guard pagesCount != nextIndex else{
            return nil
        }
        guard pagesCount > nextIndex else{
            return nil
        }
        return viewControllerAtIndex(nextIndex)
    }
}
//MARK: - Delegate methods
extension IGVPageViewController: UIPageViewControllerDelegate{
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool){
        notifyDelegateOfNewIndex()
    }
}