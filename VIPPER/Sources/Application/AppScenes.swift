//
//  AppScenes.swift
//  VIPPER
//
//  Created by Manh Pham on 06/06/2021.
//

enum AppScenes {
    case main
    case login
    case detail(event: Event)

    var viewController: UIViewController {
        switch self {
        case .main:
            let vc = StoryboardScene.Home.initialScene.instantiate()
            return vc
        case .login:
            let vc = StoryboardScene.Login.initialScene.instantiate()
            return vc
        case let .detail(event):
            let vc = StoryboardScene.Detail.initialScene.instantiate()
            vc.title = event.repo?.name
            return vc
        }
    }
}
