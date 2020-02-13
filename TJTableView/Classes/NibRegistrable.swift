//
//  NibRegistrable.swift
//  TJTableView
//
import UIKit

protocol NibRegistrable: Registrable {
    static var nib: UINib { get }
}

extension NibRegistrable {
    static var nib: UINib {
        let nibName = String(describing: self)
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
}