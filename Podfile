# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'



target 'ribeat-mc' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
 post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.2'
      end
    end
  end  
  # ignore all warnings from all pods
  inhibit_all_warnings!
  
  # Pods for SafeRT

  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Alamofire',  '~> 4.5'
  pod 'SwiftSocket'
 
  target 'ribeat-mcTests' do
    inherit! :search_paths
    pod 'RxBlocking', '~> 4.0'
    pod 'RxTest',     '~> 4.0'
  end

end
