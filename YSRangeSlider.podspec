Pod::Spec.new do |s|
  s.name     = 'YSRangeSlider'
  s.version  = '3.1.0'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'Configurable range slider for iOS (IBInspectable and IBDesignable)'
  s.homepage = 'https://github.com/YardiSystems/YSRangeSlider'
  s.source   = { :git => 'https://github.com/YardiSystems/YSRangeSlider.git',
                 :tag => "#{s.version}" }
  s.authors  = { 'Laurentiu Ungur' => 'laurentiu.ungur@yardi.com' }
  s.requires_arc = true
  s.platform     = :ios, "8.0"
  s.preserve_paths = 'README*'
  s.xcconfig = { 'SWIFT_VERSION' => '3.0' }
  s.default_subspec = 'Core'

  s.subspec 'Core' do |ss|
    ss.source_files = 'YSRangeSlider/*.swift'
    ss.framework  = 'UIKit'
  end

  s.subspec 'RxSwift' do |ss|
    ss.source_files = 'YSRangeSlider/RxSwift/*.swift'
    ss.dependency 'YSRangeSlider/Core'
    ss.dependency 'RxCocoa'
  end

end
