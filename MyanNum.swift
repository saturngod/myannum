protocol MyanNum {}

extension MyanNum {
    func toMyanmarNumber() -> String? {
        
        guard let this = self as? NSNumber else {
            return nil
        }
        let value =  "\(this)".map { (char) -> Int in
            let code = Int(UnicodeScalar(String(char))!.value)
            
            return (char == "." || char == "-") ? code : code + 4112
            }.reduce("") { "\($0)\(String(Character(UnicodeScalar($1)!)))" }
        return value
    }
}

extension Int : MyanNum {}
extension Double : MyanNum {}