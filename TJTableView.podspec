#
# Be sure to run `pod lib lint TJTableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TJTableView'
  s.version          = '0.1.0'
  s.summary          = 'UITableView extensions.'
  s.description      = <<-DESC
UITableView extensions.
                       DESC

  s.homepage         = 'https://github.com/tanjo/TJTableView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tanjo' => 'tanjo@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/tanjo/TJTableView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/tanjoin'
  s.ios.deployment_target = '9.3'
  s.source_files = 'TJTableView/Classes/**/*'
  s.frameworks = 'UIKit'
end
