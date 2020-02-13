//
//  Registrable.swift
//  TJTableView
//
import UIKit

protocol Registrable: class {
    static var reuseIdentifier: String { get }
}

extension Registrable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}