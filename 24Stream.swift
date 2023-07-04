//
//  24Stream.swift
//  24stream
//
//  Created by Farhad Gojazade on 04.07.23.
//

import Foundation

public class Stream24 {
    public static func GetHTML(brand: String, retailerDomain:String, productId: String, templateType: String = "master_template", page: String = "index.html", language: String = "ru", contentType: Stream24ContentType = Stream24ContentType.shopInShops, resultType: Stream24ResultType = Stream24ResultType.html) -> String {

        return """
                              <!DOCTYPE html>
                              <html lang="en">

                              <head>
                                  <meta charset="UTF-8">
                                  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
                                  <title>24 Stream</title>
                                  <script async="" src="https://content.24ttl.stream/widget.js"></script>
                              </head>

                              <body>
                                  <div class="wrapper"></div>
                                  <script>(function (w, d, s, o) { var f = d.getElementsByTagName(s)[0]; var j = d.createElement(s); w.TTLStreamReady = new Promise((resolve) => { j.async = true; j.src = 'https://content.24ttl.stream/widget.js'; f.parentNode.insertBefore(j, f); j.onload = function () { w.ttlStream = new TTLStream(o); resolve(w.ttlStream); }; }); })(window, document, 'script', {}); </script>
                                  <script>
    
            const parameters = { "brand": "\(brand)", "productId": "\(productId)", "retailerDomain": "\(retailerDomain)", "templateType": "\(templateType)", "resultType": "\(_getResultType(resultType: resultType))", "contentType": "\(_getContentType(contentType: contentType))", "el": ".wrapper", "windowMode": "self" }
                                      //const parameters = { "brand": "Samsung", "productId": "16651081549", "retailerDomain": "irshad.az", "templateType": "master_template", "resultType": "html", "contentType": "sis", "el": ".wrapper" }
                                      //const parameters = { "brand": "HyundaiTest", "productId": "166510815450", "retailerDomain": "24ttl.ru", "templateType": "master_template", "resultType": "html", "contentType": "sis", "el": ".wrapper" }
                                      TTLStreamReady.then(() => { ttlStream.findAndInsert(parameters); }); </script>
                              </body>

                              </html>
    """;
    }
    
     static func _getContentType( contentType:Stream24ContentType) -> String {
      switch (contentType) {
        case Stream24ContentType.shopInShops:
          return "sis";
        case Stream24ContentType.minisite:
          return "minisite";
      }
    }

     static func _getResultType( resultType:Stream24ResultType) -> String {
      switch (resultType) {
        case Stream24ResultType.json:
          return "json";
        case Stream24ResultType.html:
          return "html";
        case Stream24ResultType.iframe:
          return "iframe";
      }
     }
    
}



public enum Stream24ContentType { case shopInShops;case minisite}

public enum Stream24ResultType {case html; case json; case iframe}
