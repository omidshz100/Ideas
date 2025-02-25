//
//  Extensions.swift
//  Ideas
//
//  Created by Omid Shojaeian Zanjani on 10/02/25.
//

import Foundation

extension String {
    
    var ord: Int? {
        guard !self.isEmpty else { return nil }
        return Int((self as NSString).character(at: 0))
    }

    var fromCharCode: String? {
        guard let code = Int(self) else { return nil }
        return String(NSString(format: "%C", code))
    }

}


extension Range where Bound == Int {
    
    var toArray: [Int] { map { $0 } }

}

