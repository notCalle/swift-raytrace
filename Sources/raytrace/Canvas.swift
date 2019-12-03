//
//  Canvas.swift
//  
//
//  Created by Calle Englund on 2019-12-03.
//

import Foundation

class Canvas {
    let width: Int
    let height: Int
    var count: Int { width * height }

    private var buffer: [UInt16]
    private static let bitsPerComponent = MemoryLayout<UInt16>.size * 8
    private static let bytesPerPixel = MemoryLayout<UInt16>.size * 3
    private static let bitsPerPixel = bytesPerPixel * 8

    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        self.buffer = Array(repeating: 0, count: width * height * 3)
    }

    func set(x: Int, y: Int, _ value: Pixel) {
        let base = (x + y * width) * 3
        let r = min(max(0.0, value.r), 1.0)
        let g = min(max(0.0, value.g), 1.0)
        let b = min(max(0.0, value.b), 1.0)

        buffer[base + 0] = UInt16(r * 65535)
        buffer[base + 1] = UInt16(g * 65535)
        buffer[base + 2] = UInt16(b * 65535)
    }

    func get(x: Int, y: Int) -> Pixel {
        let base = (x + y * width) * 3
        let r = Float(buffer[base + 0]) / 65535
        let g = Float(buffer[base + 1]) / 65535
        let b = Float(buffer[base + 2]) / 65535

        return Pixel(r, g, b)
    }

    var image: CGImage? {
        let data = Data(bytes: &buffer, count: count * Canvas.bytesPerPixel)

        guard let provider = CGDataProvider(data: data as CFData)
            else { return nil }

        guard let colorSpace = CGColorSpace(name: CGColorSpace.extendedLinearDisplayP3)
            else { return nil }

        let bitmapInfo = CGBitmapInfo.byteOrder16Little

        return CGImage(width: width,
                       height: height,
                       bitsPerComponent: Canvas.bitsPerComponent,
                       bitsPerPixel: Canvas.bitsPerPixel,
                       bytesPerRow: width * Canvas.bytesPerPixel,
                       space: colorSpace,
                       bitmapInfo: bitmapInfo,
                       provider: provider,
                       decode: nil,
                       shouldInterpolate: true,
                       intent: .perceptual)
    }
}
