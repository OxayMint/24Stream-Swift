# 24stream

[![CI Status](https://img.shields.io/travis/26540645/24stream.svg?style=flat)](https://travis-ci.org/26540645/24stream)
[![Version](https://img.shields.io/cocoapods/v/24stream.svg?style=flat)](https://cocoapods.org/pods/24stream)
[![License](https://img.shields.io/cocoapods/l/24stream.svg?style=flat)](https://cocoapods.org/pods/24stream)
[![Platform](https://img.shields.io/cocoapods/p/24stream.svg?style=flat)](https://cocoapods.org/pods/24stream)

An iOS plugin for generating 24Stream HTML widgets to be used in WKWebView or any other nested browser.

## Installation

24stream is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod '24stream'
```

## Usage

You need to import it as `import _24stream`. After that you can use Stream24 namespace which contains:

#### GetHtml

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `brand` | `string` | **Required**. Brand name for the page |
| `productId` | `string` | **Required**. Prouct ID for the page |
| `retailerDomain` | `string` | **Required**. Domain of the retailer of the page |
| `templateType` | `string` | **Required**. Template type of the page |
| `language` | `string` | Language of the page. Defaults to `ru` |
| `resultType` | `Stream24ResultType` | Result type of the page. One of `.json`, `.html` or `.iframe`. Defaults to `.html`|
| `contentType` | `Stream24ContentType` | Content type of the page. One of `.shopInShops` or `.minisite`. Defaults to `.minisite`|

Returns the HTML code of the page which can be used to render inside a webview like WKWebView.

## Example

```swift

import SwiftUI
import WebKit
import _24stream

struct ContentView: UIViewRepresentable {

    var html = Stream24.GetHTML(brand: "Samsung", retailerDomain: "irshad.az", productId: "16651081549")
    
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }
 
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(html, baseURL: nil)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


```

## License

24stream is available under the MIT license. See the LICENSE file for more info.
