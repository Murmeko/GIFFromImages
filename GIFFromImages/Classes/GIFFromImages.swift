import UIKit
import MobileCoreServices

public class GIFFromImages {
    public enum colorSpace {
        case rgb
        case gray
    }
    public init () {}
}

extension GIFFromImages {
    func makeFileURL(filename: String) -> URL {
        let gifDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let gifFileURL = gifDirectory.appendingPathComponent(filename)
        return gifFileURL
    }
    
    public func generateGifFromImages(images: [UIImage], fileURL: URL, colorSpace: colorSpace, delayTime: Double, loopCount: Int) {
        let gifGroup = DispatchGroup()
        var tempImages: [UIImage] = []
        for image in images {
            gifGroup.enter()
            let imageWidth = 500
            let imageHeight = 500
            var imageColorSpace: CGColorSpace
            if colorSpace == .rgb {
                imageColorSpace = CGColorSpaceCreateDeviceRGB()
            } else {
                imageColorSpace = CGColorSpaceCreateDeviceGray()
            }
            let imageRect: CGRect = CGRect(x:0, y:0, width:imageWidth, height: imageHeight)
            let imageBitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
            let context = CGContext(data: nil, width: imageWidth, height: imageHeight, bitsPerComponent: 8, bytesPerRow: 0, space: imageColorSpace, bitmapInfo: imageBitmapInfo.rawValue)
            if let cgImg = image.cgImage {
                context?.draw(cgImg, in: imageRect)
                if let makeImg = context?.makeImage() {
                    let imageRef = makeImg
                    let newImage = UIImage(cgImage: imageRef)
                    tempImages.append(newImage)
                    gifGroup.leave()
                }
            }
        }
        
        gifGroup.notify(queue: .main) {
            let gifFileProperties: CFDictionary = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFLoopCount as String: loopCount]]  as CFDictionary
            let gifFrameProperties: CFDictionary = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFDelayTime as String: delayTime]] as CFDictionary
            if let url = fileURL as CFURL? {
                if let destination = CGImageDestinationCreateWithURL(url, kUTTypeGIF, images.count, nil) {
                    CGImageDestinationSetProperties(destination, gifFileProperties)
                    for image in tempImages {
                        if let cgImage = image.cgImage {
                            CGImageDestinationAddImage(destination, cgImage, gifFrameProperties)
                        }
                    }
                    if !CGImageDestinationFinalize(destination) {
                        print("Failed to finalize the image destination")
                    }
                }
            }
        }
    }
}

