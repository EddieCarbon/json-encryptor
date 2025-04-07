//
//  encrypt.swift
//  JSONEncryptor
//
//  Created by Jakub Tomiczek on 07/04/2025.
//

import Foundation
import CryptoKit

func encryptJSONFile(inputPath: String, outputPath: String) {
    guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: inputPath)) else {
        print("Nie można wczytać pliku JSON")
        return
    }
    
    // Generating a 32-byte AES-256 key
    let key = SymmetricKey(size: .bits256)
    let keyData = key.withUnsafeBytes { Data($0) }
    
    do {
        // Data encryption
        let nonce = AES.GCM.Nonce()
        let sealedBox = try AES.GCM.seal(jsonData, using: key, nonce: nonce)
        
        // Saving encrypted data
        try sealedBox.combined!.write(to: URL(fileURLWithPath: outputPath))
        
        // Display the key in Base64 from (save it safely!)
        let keyBase64 = keyData.base64EncodedString()
        let nonceBase64 = nonce.withUnsafeBytes { Data($0) }.base64EncodedString()
        
        print("Key (save it safely): \(keyBase64)")
        print("Nonce: \(nonceBase64)")
        
        print("File successfully encrypted and saved to: \(outputPath)")
    } catch {
        print("Error while encrypting: \(error)")
    }
}
