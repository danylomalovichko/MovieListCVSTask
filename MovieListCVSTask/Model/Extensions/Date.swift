//
//  Date.swift
//  MovieListCVSTask
//
//  Created by Danylo Malovichko on 27.12.2023.
//

import Foundation

extension Date {
    var year: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter.string(from: self)
    }
    
    var yearAndMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy, d MMMM"
        return formatter.string(from: self)
    }
}
