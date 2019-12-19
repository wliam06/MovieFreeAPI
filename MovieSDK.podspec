#
# Be sure to run `pod lib lint MovieSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MovieSDK'
  s.version          = '1.0.0'
  s.summary          = 'A short description of MovieSDK.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/William/MovieSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'William' => 'will.liiam06@gmail.com' }
  s.source           = { :git => 'git@github.com:wliam06/MovieFreeAPI.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'MovieSDK/Classes/**/*'
  # s.resource_bundles = {
  #   'MovieSDK' => ['MovieSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
