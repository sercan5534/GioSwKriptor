#
# Be sure to run `pod lib lint GioSwKriptor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GioSwKriptor'
  s.version          = '0.1.3'
  s.summary          = 'GioSwKriptor is a wrapper library of OPENSSL for swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
GioSwKriptor is in development process and it just does Diffie-Helman key exchange according to 2048-bit MODP Group with 256-bit Prime Order Subgroup in RFC5114(https://tools.ietf.org/html/rfc5114)
                       DESC

  s.homepage         = 'https://github.com/sercan5534/GioSwKriptor'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sercan Özen' => 'sercangsu@gmail.com' }
  s.source           = { :git => 'https://github.com/sercan5534/GioSwKriptor.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/cakrakafas'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GioSwKriptor/Classes/**/*'
  s.ios.source_files        = 'GioSwKriptor/openssl-ios/openssl/*.h'
#s.ios.public_header_files = 'GioSwKriptor/openssl-ios/openssl/*.h'
 s.ios.preserve_paths      = 'GioSwKriptor/openssl-ios/libcrypto.a', 'GioSwKriptor/openssl-ios/libssl.a'
s.ios.vendored_libraries  = 'GioSwKriptor/openssl-ios/libcrypto.a', 'GioSwKriptor/openssl-ios/libssl.a'

  # s.resource_bundles = {
  #   'GioSwKriptor' => ['GioSwKriptor/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.frameworks = 'OpenSSL-iOS'
 s.dependency  'OpenSSL-iOS','1.0.204'
#   s.module_map = 'Example/Pods/OpenSSL-iOS/module.modulemap'
end
