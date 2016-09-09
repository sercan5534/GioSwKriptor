//
//  GioDH.swift
//  Pods
//
//  Created by Sercan on 08/09/16.
//
//

import Foundation

enum DHError:ErrorType{
    case DHGeneration
}

public class GioDH{
    var p = BN_new()
    var g = BN_new()
    var dhPubKey: UnsafeMutablePointer<BIGNUM>?
    var dhPriKey: UnsafeMutablePointer<BIGNUM>?
    var dh: UnsafeMutablePointer<DH>
    var myDHPubKey:String?
    var myDHPrivKey:String?
    public var commonKey:String?
    
    /**
     Constructor method
     */
    public init(){
        self.dh = DH_get_2048_256()
        DH_generate_key(dh)
        
        self.dhPubKey = dh.memory.pub_key
        self.dhPriKey = dh.memory.priv_key
        
        //converting dh pub key to str
        var myDHPubKey = [UInt8](count: 256 , repeatedValue: 0)
        BN_bn2bin(self.dhPubKey!, &myDHPubKey)
        let myDHPubKeyData = NSData(bytes: myDHPubKey, length:myDHPubKey.count)
        self.myDHPubKey = myDHPubKeyData.getHex()
        
        //converting dh pri key to str
        var myDHPriKey = [UInt8](count: 256 , repeatedValue: 0)
        BN_bn2bin(self.dhPriKey!, &myDHPriKey)
        let myDHPriKeyData = NSData(bytes: myDHPriKey, length:myDHPriKey.count)
        self.myDHPrivKey = myDHPriKeyData.getHex()
        
    }
    
    /**
     Constructor
     public init(p:String,g:String){
     //TODO
     }
     
     */
    
    private func getCommonKey(peerPubKey:String) throws-> [UInt8]{
        //Generating common key
        let peerPubStr = peerPubKey
        var pubBIGNUM = BN_new()
        BN_hex2bn(&pubBIGNUM, peerPubStr)
        
        var commonKeyArr = [UInt8](count: 256, repeatedValue: 0)
        let status = DH_compute_key(&commonKeyArr, pubBIGNUM, self.dh)
        if(status < 0){
            throw DHError.DHGeneration
        }
        return commonKeyArr
    }
    
    public func getDHKeys(peerPubKey:String) throws {
        do{
            var codes = Int32()
            var status = DH_check(self.dh, &codes)
            
            //common key converting to str
            let commonKeyArr = try getCommonKey(peerPubKey)
            let commonKeyData = NSData(bytes: commonKeyArr, length:commonKeyArr.count )
            self.commonKey = commonKeyData.getHex()
        }catch let err as NSError{
            throw DHError.DHGeneration
        }
    }
}