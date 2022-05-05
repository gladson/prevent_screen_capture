#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint prevent_screen_capture.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'prevent_screen_capture'
  s.version          = '0.0.1'
  s.summary          = 'Plugin that protects against taking screenshot and screen recording'
  s.description      = <<-DESC
  Plugin that protects against taking screenshot and screen recording
                       DESC
  s.homepage         = 'https://github.com/gladson/prevent_screen_captures'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Gladson' => 'gladsonbrito@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
