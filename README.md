# GIFFromImages

[![Platform](https://img.shields.io/cocoapods/p/GIFFromImages.svg?style=flat)](https://cocoapods.org/pods/GIFFromImages)
[![Version](https://img.shields.io/cocoapods/v/GIFFromImages.svg?style=flat)](https://cocoapods.org/pods/GIFFromImages)
[![Bitrise Build Status](https://app.bitrise.io/app/64a3f2225b7b7b16/status.svg?token=X0Q7u-cORmvY1dR9JKAKHg)](https://app.bitrise.io/app/64a3f2225b7b7b16)
[![Travis Build Status](https://app.travis-ci.com/Murmeko/GIFFromImages.svg?branch=main)](https://app.travis-ci.com/Murmeko/GIFFromImages)
[![Maintainability](https://api.codeclimate.com/v1/badges/8a266448eda832592016/maintainability)](https://codeclimate.com/github/Murmeko/GIFFromImages/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/8a266448eda832592016/test_coverage)](https://codeclimate.com/github/Murmeko/GIFFromImages/test_coverage)
[![License](https://img.shields.io/cocoapods/l/GIFFromImages.svg?style=flat)](https://cocoapods.org/pods/GIFFromImages)


## Requirements

| Platform | Installation |
| --- | --- |
| iOS 12.0+ | [CocoaPods](#cocoapods) |


## Installation


GIFFromImages is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GIFFromImages'
```


## How to use 

```swift

import UIKit
import GIFFromImages

class ViewController: UIViewController {
    var gifManager = GIFFromImages()
    var images: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var gifURL = gifManager.makeFileURL(filename: "example")
        gifManager.generateGifFromImages(images: images, fileURL: gifURL, colorSpace: .rgb, delayTime: 1.0, loopCount: 0)
    }
}

```


## How to create

### English
[Medium](https://medium.com/@yigiterdinc/ios-app-development-publishing-a-cocoapods-library-that-converts-images-to-gifs-with-swift-326356ee000f)
[Dev.to](https://dev.to/murmeko/ios-app-development-publishing-a-cocoapods-library-that-converts-images-to-gifs-with-swift-5ckm)

### Turkish
[Medium](https://medium.com/@yigiterdinc/ios-uygulama-geli%C5%9Ftirme-swift-ile-resimleri-gife-%C3%A7eviren-bir-cocoapods-k%C3%BCt%C3%BCphanesi-yay%C4%B1nlamak-d5d973e31966)


## License

GIFFromImages is available under the MIT license. See the LICENSE file for more info.
