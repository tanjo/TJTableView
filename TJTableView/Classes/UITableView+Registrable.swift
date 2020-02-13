//
//  UITableView+Registrable.swift
//  TJTableView
//
import UIKit

extension UITableView {
    func register<T>(_ registrableType: T.Type) where T: UITableViewCell {
        switch registrableType {
        case let nibRegistrableType as NibRegistrable.Type:
            register(nibRegistrableType.nib, forCellReuseIdentifier: nibRegistrableType.reuseIdentifier)
        case let classRegistrableType as ClassRegistrable.Type:
            register(classRegistrableType, forCellReuseIdentifier: classRegistrableType.reuseIdentifier)
        default:
            register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        }
    }

    func registers(_ types: [UITableViewCell.Type]) {
        for type in types {
            register(type)
        }
    }

    func dequeueReusableCell<T>(for indexPath: IndexPath) -> T where T: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with type \(T.self)")
        }
        return cell
    }

    func register<T>(_ registrableType: T.Type) where T: UITableViewHeaderFooterView {
        switch registrableType {
        case let nibRegistrableType as NibRegistrable.Type:
            register(nibRegistrableType.nib, forHeaderFooterViewReuseIdentifier: nibRegistrableType.reuseIdentifier)
        case let classRegistrableType as ClassRegistrable.Type:
            register(classRegistrableType, forHeaderFooterViewReuseIdentifier: classRegistrableType.reuseIdentifier)
        default:
            register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: String(describing: UITableViewHeaderFooterView.self))
        }
    }

    func registers(_ types: [UITableViewHeaderFooterView.Type]) {
        for type in types {
            register(type)
        }
    }

    func dequeueReusableHeaderFooter<T>(for registrableType: T.Type) -> T where T: UITableViewHeaderFooterView {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Could not dequeue header/footer with type \(T.self)")
        }
        return view
    }
}