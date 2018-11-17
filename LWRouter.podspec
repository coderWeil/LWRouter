
Pod::Spec.new do |s|


  s.name         = "LWRouter"
  s.version      = "0.0.2"
  s.summary      = "路由"

  s.description  = "管理跳转的逻辑"

  s.homepage     = "https://github.com/weilLove/LWRouter"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "liwei02" => "weil218@163.com" }

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/weilLove/LWRouter.git", :tag => "#{s.version}" }

  s.source_files  = "LWRouter/Classess", "LWRouter/Classess/*.{h,m}"

  s.frameworks = "UIKit", "Foundation"

 
end
