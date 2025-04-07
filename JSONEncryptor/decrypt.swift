//
//  decrypt.swift
//  JSONEncryptor
//
//  Created by Jakub Tomiczek on 07/04/2025.
//

import Foundation
import CryptoKit



func decryptJSONFile(filePath: String) -> [String: Any]? {
    guard let encryptedData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
          let keyData = Data(base64Encoded: keyBase64) else {
        print("Could not load file or key/nonce")
        return nil
    }
    
    do {
        let key = SymmetricKey(data: keyData)
        
        // Creating a SealedBox from data
        let sealedBox = try AES.GCM.SealedBox(combined: encryptedData)
        
        // Decryption
        let decryptedData = try AES.GCM.open(sealedBox, using: key)
        
        // Parse JSON
        if let jsonObject = try JSONSerialization.jsonObject(with: decryptedData, options: []) as? [String: Any] {
            return jsonObject
        } else {
            print("Cannot parse JSON")
            return nil
        }
    } catch {
        print("Error while decrypting: \(error)")
        return nil
    }
}
