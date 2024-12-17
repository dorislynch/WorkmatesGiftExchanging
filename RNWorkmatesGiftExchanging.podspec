
Pod::Spec.new do |s|
  s.name         = "RNWorkmatesGiftExchanging"
  s.version      = "1.0.0"
  s.summary      = "RNWorkmatesGiftExchanging"
  s.description  = <<-DESC
                  RNWorkmatesGiftExchanging
                   DESC
  s.homepage     = "https://github.com/dorislynch/WorkmatesGiftExchanging"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/dorislynch/WorkmatesGiftExchanging.git", :tag => "master" }
  s.source_files  = "ios/**/*.{h,m}"
  s.requires_arc = true
                 
                 
  s.dependency 'React'
  s.dependency 'GCDWebServer'
  #s.dependency "others"

end

  