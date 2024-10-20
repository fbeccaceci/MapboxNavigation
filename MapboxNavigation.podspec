require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))
folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|
  s.name         = "MapboxNavigation"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "14.0" }
  s.source       = { :git => "https://github.com/fbeccaceci/react-native-mapbox-navigation.git", :tag => "#{s.version}" }

  # Mapbox Navigation Sdk
  s.vendored_frameworks = [
    "ios/Frameworks/_MapboxNavigationHelpers.xcframework",
    "ios/Frameworks/MapboxCommon.xcframework",
    "ios/Frameworks/MapboxCoreMaps.xcframework",
    "ios/Frameworks/MapboxDirections.xcframework",
    "ios/Frameworks/MapboxMaps.xcframework",
    "ios/Frameworks/MapboxNavigationCore.xcframework",
    "ios/Frameworks/MapboxNavigationNative.xcframework",
    "ios/Frameworks/MapboxNavigationUIKit.xcframework",
    "ios/Frameworks/Turf.xcframework"
  ]

  s.exclude_files = ["ios/Frameworks/*.xcframework/**/*.h"]

  s.source_files = [
    "ios/**/*.{h,m,mm,cpp,swift}",
    # Implementation (Swift)
    "ios/**/*.{swift}",
    # Autolinking/Registration (Objective-C++)
    "ios/**/*.{m,mm}",
    # Implementation (C++ objects)
    "cpp/**/*.{hpp,cpp}",
  ]

  s.pod_target_xcconfig    = {
    "DEFINES_MODULE" => "YES",
    "OTHER_CPLUSPLUSFLAGS" => "-DRCT_NEW_ARCH_ENABLED=1",
  }

  # Use install_modules_dependencies helper to install the dependencies if React Native version >=0.71.0.
  # See https://github.com/facebook/react-native/blob/febf6b7f33fdb4904669f99d795eba4c0f95d7bf/scripts/cocoapods/new_architecture.rb#L79.
  if respond_to?(:install_modules_dependencies, true)
    install_modules_dependencies(s)
  else
    s.dependency "React-Core"

    # Don't install the dependencies when we run `pod install` in the old architecture.
    if ENV['RCT_NEW_ARCH_ENABLED'] == '1' then
      s.compiler_flags = folly_compiler_flags + " -DRCT_NEW_ARCH_ENABLED=1"
      s.pod_target_xcconfig    = {
          "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\"",
          "OTHER_CPLUSPLUSFLAGS" => "-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1",
          "CLANG_CXX_LANGUAGE_STANDARD" => "c++17"
      }
      s.dependency "React-RCTFabric"
      s.dependency "React-Codegen"
      s.dependency "RCT-Folly"
      s.dependency "RCTRequired"
      s.dependency "RCTTypeSafety"
      s.dependency "ReactCommon/turbomodule/core"
    end
  end

  # Nitro module configuration
  load 'nitrogen/generated/ios/MapboxNavigation+autolinking.rb'
  add_nitrogen_files(s)

end
