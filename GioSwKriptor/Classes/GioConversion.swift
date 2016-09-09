//
//  GioConversion.swift
//  Pods
//
//  Created by Sercan on 08/09/16.
//
//

class GioConversion{
    public func convertDictionaryToJsonString(data:NSDictionary) -> String{
        do{
            let jsonData: NSData = try NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions.PrettyPrinted)
            return NSString(data: jsonData, encoding: NSUTF8StringEncoding)! as String
        }
        catch let error as NSError {
            print("error in convertDictionaryToJsonString : \(error.description)")
            return ""
        }
    }
    
    public func convertStringToDictionary(text: String) throws -> [String:AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String:AnyObject]
                return json
            } catch  let error as NSError {
                print("error in convertStringToDictionary : \(error.description)")
                throw ConversionErrorType.DecodingError("Decoding problem")
            }
        }
        return nil
    }
    
    public func convertNSDataToByteArray(data:NSData) throws-> [UInt8]{
        do{
            let length = data.length
            var arr = [UInt8](count: length, repeatedValue: 0)
            data.getBytes(&arr, length: length)
            return arr
        }
        catch let error as NSError{
            print("error in convertStringToDictionary : \(error.description)")
            throw ConversionErrorType.DecodingError("Decoding problem")
            
        }
    }
    
    public func hexToByteArray(hex:String) -> [UInt8] {
        let tempStr = NSString(string: hex)
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
