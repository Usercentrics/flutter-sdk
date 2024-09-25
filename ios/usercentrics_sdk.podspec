Pod::Spec.new do |s|
  s.name             = 'usercentrics_sdk'
  s.version = '2.17.1'
  s.summary          = 'Usercentrics Flutter SDK.'
  s.description      = <<-DESC
  Usercentrics Flutter SDK.
                       DESC
  s.homepage         = 'https://docs.usercentrics.com/cmp_in_app_sdk/latest/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Usercentrics' => 'developer@usercentrics.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'UsercentricsUI', "#{s.version}"
  s.platform = :ios
  s.ios.deployment_target = '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.3'
end
