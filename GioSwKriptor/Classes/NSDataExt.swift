//
//  NSDataExt.swift
//  Pods
//
//  Created by Sercan on 08/09/16.
//
//

extension NSData {
    func getHex() -> String? {
        let  hexChars = Array("0123456789abcdef".utf8) as [UInt8]
        let buf = UnsafeBufferPointer<UInt8>(start: UnsafePointer(bytes), count: length)
        var output = [UInt8](count: length*2 + 1, repeatedValue: 0)
        var ix:Int = 0
        for b in buf {
            let hi  = Int((b & 0xf0) >> 4)
            let low = Int(b & 0x0f);
            output[ix++] = hexChars[ hi]
            output[ix++] = hexChars[low]
        }
        let result = String.fromCString(UnsafePointer(output))!
        return result
    }
}

