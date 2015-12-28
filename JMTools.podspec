Pod::Spec.new do |s|
    s.name         = "JMTools"
    s.version      = "0.0.1"
    s.summary      = "A short description of JMTools."
    s.homepage     = "https://github.com/xserver/JMTools"
    s.license      = "MIT"
    s.author       = { "xserver" => "xqlday@163.com" }
    s.platform     = :ios
    s.requires_arc = true
    s.source       = { :git => "https://github.com/xserver/JMTools.git", :commit => "" }
    s.source_files = "JMTools/JMTools/*", "JMTools/JMTools/*"
end