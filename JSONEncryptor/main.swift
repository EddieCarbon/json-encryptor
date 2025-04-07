//
//  main.swift
//  JSONEncryptor
//
//  Created by Jakub Tomiczek on 07/04/2025.
//

import Foundation

// uncomment the code you need!

// MARK: - Encrypt
// Filepaths - change this to yours
let inputPath = "YOU_JSON_FILE_PATH_HERE"
let outputPath = "YOUR_ENCRYPTED_FILE_PATH_HERE"

encryptJSONFile(inputPath: inputPath, outputPath: outputPath)


// MARK: - Decrypt
//let encryptedFilePath = "YOU_ENCRYPTED_FILE_PATH_HERE"
//
//let keyBase64 = "YOUR_KEY_HERE"
//let nonceBase64 = "YOUR_NONCE_HERE"
//
//if let jsonData = decryptJSONFile(filePath: encryptedFilePath) {
//    print("JSON:")
//    for (key, value) in jsonData {
//        print("\(key): \(value)")
//    }
//} else {
//    print("Failed to decrypt file.")
//}
