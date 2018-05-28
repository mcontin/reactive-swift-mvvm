# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

ENV['COCOAPODS_DISABLE_STATS'] = 'true'

target 'MVVM' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    # Alamofire wrapper
    pod 'Moya/RxSwift', '~> 11.0'

    # RxSwift
    pod 'RxCocoa',       '~> 4.1'
    pod 'RxDataSources', '~> 3.0'

    # Realm
    pod 'RealmSwift', '~> 3.5'

    # R.swift
    pod 'R.swift', '4.0.0'

    target 'MVVMTests' do
    inherit! :search_paths
    # Pods for testing
    end

    target 'MVVMUITests' do
    inherit! :search_paths
    # Pods for testing
    end

end
