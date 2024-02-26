import Cocoa

import Foundation

// 將十六進位制字符串轉換為Data
let hexString = "30818902818100c63f690acb65f5e59d0e14d85c832e0e688ca31ef7e6d9c0c5bd95c0675bdc99679f4d9bed2c7b236fa69a61987704af9742b21a376cd9471df0fe3f243d54da83706083c20bba1f7dba4c43ac19efb0705d2838ac7f8040f875aeda64312062c22b1366d375e1a01ef59240a86b3d5970fedb51068b478fce57448d7b0298950203010001"
var modulusAndExponentData = Data(hex: hexString)

// 定義一個擴展來將十六進位制字符串轉換為Data
extension Data {
    init(hex: String) {
        self.init()
        var hex = hex
        while !hex.isEmpty {
            let c = String(hex.prefix(2))
            hex = String(hex.dropFirst(2))
            var ch: UInt32 = 0
            Scanner(string: c).scanHexInt32(&ch)
            var char = UInt8(ch)
            self.append(&char, count: 1)
        }
    }
}

// 假設公開指數e總是65537，且在數據的末尾以"010001"表示
let exponentHex = "010001"
let exponentData = Data(hex: exponentHex)

// 提取模數
let modulusData = modulusAndExponentData.subdata(in: 0..<modulusAndExponentData.count - exponentData.count)

// 轉換模數和指數為大整數或其它所需格式
// 這裡示範的是如何提取原始數據，轉換為具體數值可能需要使用第三方庫或更多處理

// 打印結果
print("Modulus: \(modulusData as NSData)")
print("Exponent: \(exponentData as NSData)")

