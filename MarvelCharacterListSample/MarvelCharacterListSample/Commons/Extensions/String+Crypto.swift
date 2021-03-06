//
//  String+Crypto.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 07/09/2021.
//

import Foundation
import CommonCrypto

extension String {
    
    var md5: String {
        return HMAC.hash(self, algo: .MD5)
    }
}

private struct HMAC {
    
    static func hash(_ inp: String, algo: HMACAlgo) -> String {
        
        if let stringData = inp.data(using: .utf8, allowLossyConversion: false) {
            
            return hexStringFromData(digest(stringData as NSData, algo: algo))
        }
        
        return ""
    }
    
    private static func digest(_ input: NSData, algo: HMACAlgo) -> NSData {
        
        let digestLength = algo.digestLength()
        var hash = [UInt8](repeating: 0, count: digestLength)
        switch algo {
        case .MD5: CC_MD5(input.bytes, UInt32(input.length), &hash)
        }
        return NSData(bytes: hash, length: digestLength)
    }
    
    private static func hexStringFromData(_ input: NSData) -> String {
        
        var bytes = [UInt8](repeating: 0, count: input.length)
        input.getBytes(&bytes, length: input.length)
        var hexString = ""
        for byte in bytes {
            hexString += String(format:"%02x", UInt8(byte))
        }
        return hexString
    }
}

private enum HMACAlgo {
    
    case MD5
    
    func digestLength() -> Int {
        
        var result: CInt = 0
        switch self {
        case .MD5: result = CC_MD5_DIGEST_LENGTH
        }
        return Int(result)
    }
}
