import Cocoa

import Foundation

// 假設您有一個Base64字符串
let base64String = "MIGJAoGBANDtE+DympukuhrDn+xK/zPU5QeCLC8CCpLOcykECIxEwiJVKctUfb7SS9KEQ/XcnsfQUiid2FTeTAlJgVGI0FwADSv0NqdjQepICVGBRnPfj/zuPkhmqtVay8EV2semQPM3ZH6Kzj0PnHGH1h/N40cuLId8GJcFpvVw7gf5LVqpAgMBAAE="

// 將Base64字符串轉換為Data
if let base64Data = Data(base64Encoded: base64String) {
    // 將Data轉換為16進制字符串
    let hexString = base64Data.map { String(format: "%02hhx", $0) }.joined()
    
    // 計算Base64字符串和16進制字符串的長度
    let base64Length = base64String.count
    let hexLength = hexString.count
    
    print("Base64字符串：\(base64String)")
    print("Base64長度：\(base64Length)")
    print("16進制字符串：\(hexString)")
    print("16進制長度：\(hexLength)")
} else {
    print("無法將Base64字符串轉換為Data")
}
