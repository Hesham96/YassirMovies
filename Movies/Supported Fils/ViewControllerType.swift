//
//  ViewControllerType.swift
//  Movies
//
//  Created by Hesham Aly on 29/03/2022.
//


import UIKit

//sourcery: AutoMockable
public protocol ViewControllerType: AnyObject {
    var presentingView: ViewControllerType? { get }
    var navigationView: ViewControllerType? { get }
    var tabbarController: ViewControllerType? { get }

    func push(_ view: ViewControllerType, animated: Bool)
    func pop(animated: Bool)
    func popToRoot(animated: Bool)
    func pop(to source: ViewControllerType)
    @discardableResult func popToLastViewControllerOfClass(_ viewControllerClass: UIViewController.Type, animated: Bool) -> Bool
    func present(_ view: ViewControllerType, animated flag: Bool, completion: (() -> Swift.Void)?)
    func dismiss(animated flag: Bool, completion: (() -> Swift.Void)?)
    func unwind(with identifier: String)
    func addToViewWindow(subView: UIView)
}

extension ViewControllerType {
    var presentingView: ViewControllerType? { return nil }
    var navigationView: ViewControllerType? { return nil }
    var tabbarController: ViewControllerType? { return nil }
}

extension UIViewController: ViewControllerType {
    public var controller: UIViewController { return self }

    public var navigationView: ViewControllerType? {
        return navigationController ?? parent?.navigationView
    }

    public var tabbarController: ViewControllerType? {
        return tabBarController
    }

    public var presentingView: ViewControllerType? {
        return presentingViewController ?? navigationController?.presentingViewController
    }

    public func push(_ view: ViewControllerType, animated: Bool) {
        guard let viewController = view as? UIViewController else { return }
        let nav = (self as? UINavigationController) ?? self.navigationController
        nav?.pushViewController(viewController, animated: animated)
    }

    public func pop(animated: Bool) {
        _ = navigationController?.popViewController(animated: animated)
    }

    public func popToRoot(animated: Bool) {
        _ = navigationController?.popToRootViewController(animated: animated)
    }

    public func pop(to source: ViewControllerType) {
        guard let controller = source as? UIViewController else { return }
        _ = navigationController?.popToViewController(controller, animated: true)
    }

    @discardableResult public func popToLastViewControllerOfClass(_ viewControllerClass: UIViewController.Type, animated: Bool) -> Bool {
        guard let navigationController = self.navigationController, navigationController.viewControllers.count > 1 else { return false }
        for viewController in navigationController.viewControllers.reversed() {
            if viewController.isKind(of: viewControllerClass) {
                navigationController.popToViewController(viewController, animated: animated)
                return true
            }
        }
        return false
    }

    public func present(_ view: ViewControllerType, animated flag: Bool, completion: (() -> Void)?) {
        guard let viewController = view as? UIViewController else { return }
        DispatchQueue.main.async {
            self.present(viewController, animated: flag, completion: completion)
        }
    }

    public func unwind(with identifier: String) {
        performSegue(withIdentifier: identifier, sender: self)
    }

    public func addToViewWindow(subView: UIView) {
        view.window?.addSubview(subView)
    }
}
