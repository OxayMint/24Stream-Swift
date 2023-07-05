Pod::Spec.new do |spec|
  spec.name         = "24stream"
  spec.version      = "1.0"
  spec.summary      = "24Stream plugin for using in iOS applications"
  spec.homepage     = "https://24ttl.net/"
  spec.license      = "MIT"
  spec.author       = "Farhad Gojazade"
  spec.source       = { :git => "https://github.com/OxayMint/24Stream-Swift.git", :tag => "#{spec.version}" }
  # spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.source_files  = "*.swift"
  spec.exclude_files = "Classes/Exclude"
  spec.platform     = :ios, "10.0"
end
