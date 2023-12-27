//
//  String.swift
//  MovieListCVSTask
//
//  Created by Danylo Malovichko on 27.12.2023.
//

import Foundation

extension String {
    var date: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: self) ?? Date()
    }
}
