//
//  StringRepresentation.swift
//  Say Their Names
//
//  Created by Jacob Martin on 6/29/20.
//

import Foundation

// MARK: Property Wrapper
@propertyWrapper
struct StringRepresentation<T: LosslessStringConvertible> {
    private var value: T?

    var wrappedValue: T? {
        get {
            return value
        }
        set {
            value = newValue
        }
    }
    
    init(value: T) {
        self.value = value
    }
}

// MARK: Codable Conformance
extension StringRepresentation: Codable {
    init(from decoder: Decoder) throws {
        let string = try? String(from: decoder)
        value = string.flatMap(T.init)
    }

    func encode(to encoder: Encoder) throws {
        if let value = value {
            try "\(value)".encode(to: encoder)
        } else {
            // encodes to null, or {} if commented
            try Optional<String>.none.encode(to: encoder)
        }
    }
}

// MARK: Equatable Conditional Conformance
extension StringRepresentation: Equatable where T: Equatable {
    static func == (lhs: StringRepresentation<T>, rhs: StringRepresentation<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

// MARK: Hashable Conditional Conformance
extension StringRepresentation: Hashable where T: Hashable {}


// MARK: URL Compatibility
extension URL: LosslessStringConvertible {
    public init?(_ description: String) {
        guard let url = URL(string: description) else {
            return nil
        }
        
        self = url
    }
}

// MARK: Date Compatibility
extension Date: LosslessStringConvertible {
    public init?(_ description: String) {
        let formatter =  DateFormatter()
        formatter.dateFormat = "M/D/yy"
        guard let date = formatter.date(from: description) else {
            return nil
        }
        
        self = date
    }
}
