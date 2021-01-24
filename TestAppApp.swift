//
//  TestAppApp.swift
//  Shared
//
//  Created by b150005 on 2021/01/14.
//

import SwiftUI

//アプリ宣言
@main   // main属性 - プログラムのエントリーポイント(static func main()が必要)
struct TestAppApp: App {    // Appプロトコル - アプリの構造と動作を表現
    var body: some Scene {  // Sceneプロトコルに準拠したbodyプロパティの実装
                            // Sceneプロトコル - シーン(=Viewのコンテナ)を表現
        WindowGroup {   // ウィンドウの集合(マルチウィンドウ(macOS, iPadOSのみ)を構成)
            LinkView()  // 開発者独自のView
        }
    }
}
