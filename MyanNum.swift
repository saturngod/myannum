import Foundation

protocol MyanNum {}

extension MyanNum {
    func toMyanmarNumber() -> String? {
        
        guard let this = self as? NSNumber else {
            return nil
        }
        let value =  "\(this)".map { (char) -> Int in
            let code = Int(UnicodeScalar(String(char))!.value)
            return (code >= 48 && code <= 57) ? code + 4112 : code
            }.reduce("") { "\($0)\(String(Character(UnicodeScalar($1)!)))" }
        return value
    }
}

extension Int : MyanNum {}
extension Double : MyanNum {}