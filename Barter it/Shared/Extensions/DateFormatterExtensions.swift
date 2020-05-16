//
//  DateFormatterExtensions.swift
//  Barter it
//
//  Created by Martin Nasierowski on 16/05/2020.
//  Copyright © 2020 Martin Nasierowski. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var itemDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return formatter
    }
}
