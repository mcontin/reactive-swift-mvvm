# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'MVVM' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    # Alamofire wrapper
    pod 'Moya/RxSwift'
    pod 'Moya-ObjectMapper/RxSwift'

    # RxSwift
    pod 'RxSwift'#,    '~> 3.0'
    pod 'RxCocoa'#,    '~> 3.0'
    pod 'RxDataSources'#, '~> 1.0'

    # Realm
    pod 'RealmSwift'

    # R.swift
    pod 'R.swift'

    target 'MVVMTests' do
    inherit! :search_paths
    # Pods for testing
    end

    target 'MVVMUITests' do
    inherit! :search_paths
    # Pods for testing
    end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'RxSwift'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.0'
            end
        end
        if target.name == 'RxCocoa'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.0'
            end
        end
        if target.name == 'RxDataSources'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.0'
            end
        end
#        if target.name == 'ObjectMapper'
#            target.build_configurations.each do |config|
#                config.build_settings['SWIFT_VERSION'] = '3.1'
#            end
#        end
    end
end
