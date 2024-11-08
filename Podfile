# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

install! 'cocoapods', :disable_input_output_paths => true

target 'DemoIDMission' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DemoIDMission
  
  pod 'IDentityLiteSDK2.0'
  pod 'SwiftGifOrigin'
  pod 'TensorFlowLiteSwift', '~> 2.7.0'
  pod 'GoogleMLKit/FaceDetection'
  pod 'GZIP'

end
post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
   end
end
