//
//  String.swift
//  Pods
//
//  Created by Sercan on 08/09/16.
//
//

extension String{
    func convertHexToData() -> NSData? {
        let tempStr = NSString(string: self)
        let len = tempStr.length
        let data = NSMutableData(capacity: len / 2)
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .CaseInsensitive)
        
        regex.enumerateMatchesInString(self, options: [], range: NSMakeRange(0, len)) { match, flags, stop in
            let byteString = (self as NSString).substringWithRange(match!.range)
            let num = UInt8(byteString.withCString { strtoul($0, nil, 16) })
            data?.appendBytes([num], length: 1)
        }
        return data
    }
    
    func getHexUsingEncoding(encoding: NSStringEncoding) -> String? {
        let data = dataUsingEncoding(NSUTF8StringEncoding)
        return data?.getHex()
    }
    
    func getStringFromHexUsingEncoding(encoding: NSStringEncoding) -> String? {
        if let data = convertHexToData() {
            return String(data: data, encoding: encoding)
        }
        return nil
    }
    
    func base64Encoded() -> String {
        let plainData = dataUsingEncoding(NSUTF8StringEncoding)
        let base64String = plainData?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        return base64String!
    }
    
    func base64Decoded() -> String {
        let decodedData = NSData(base64EncodedString: self, options:NSDataBase64DecodingOptions(rawValue: 0))
        let decodedString = String(data: decodedData!, encoding: NSUTF8StringEncoding)
        return decodedString!
    }
    
   /* 
     TODO
     func sha256() -> String {
        let data = self.dataUsingEncoding(NSUTF8StringEncoding)!
        var digest = [UInt8](count:Int(64), repeatedValue: 0)
        CC_SHA256(data.bytes, CC_LONG(data.length), &digest)
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        
        return hexBytes.joinWithSeparator("")
    }
    
    func sha512() -> String {
        let data = self.dataUsingEncoding(NSUTF8StringEncoding)!
        var digest = [UInt8](count:Int(CC_SHA512_DIGEST_LENGTH), repeatedValue: 0)
        CC_SHA512(data.bytes, CC_LONG(data.length), &digest)
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        
        return hexBytes.joinWithSeparator("")
    }
 */
    
    func hexToByteArray() -> [UInt8] {
        let tempStr = NSString(string: self)
        let len = tempStr.length
        var arr = [UInt8]()
        
        for var i = 0; i<len; i+=2{
            let x = tempStr.substringWithRange(NSRange(location: i, length: 2))
            let y = UInt8.init(x, radix: 16)
            arr.append(y!)
        }
        return arr
    }
    
}
