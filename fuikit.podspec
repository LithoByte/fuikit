#
# Be sure to run `pod lib lint fuikit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'fuikit'
  s.version          = '0.0.3'
  s.summary          = 'fuikit makes standard iOS classes easy to use functionally.'
  s.swift_versions   = ['4.0', '4.1', '4.2', '5.0', '5.1', '5.2']

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
fuikit makes standard iOS classes easy to use with Functional Programming by adding var function properties.

For instance, instead of subclassing UIViewController, you could use FUIViewController and set the onViewDidLoad property to whatever you'd like.
                       DESC

  s.homepage         = 'https://github.com/ThryvInc/fuikit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Elliot' => '' }
  s.source           = { :git => 'https://github.com/ThryvInc/fuikit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/elliot_schrock'

  s.ios.deployment_target = '11.0'

  s.source_files = 'fuikit/Classes/**/*.swift'
  s.resources = 'fuikit/**/*.xib'
  
  # s.resource_bundles = {
  #   'fuikit' => ['fuikit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
