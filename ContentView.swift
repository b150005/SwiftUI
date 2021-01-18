//
//  ContentView.swift
//  Shared
//
//  Created by b150005 on 2021/01/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello,world!")
            .edgesIgnoringSafeArea(.all)
    }
}

struct TextView: View {
    var body: some View {
        Text("Apple is a fruit.")
            .font(.largeTitle)  // フォントの指定
                                // .largeTitle - ラージタイトル
                                // .title - タイトル
                                // .headline - ヘッドライン
                                // .subheadline - サブヘッドライン
                                // .body - 本文
                                // .callout - コールアウト
                                // .footnote - 脚注
                                // .caption - 見出し
            .lineLimit(3)       // 表示可能な最大行数
            .truncationMode(.middle)    // TextのViewサイズ > 親ViewのViewサイズ である場合の省略文字位置
                                        // .head - 文頭
                                        // .middle - 文中
                                        // .tail - 文末
            .fixedSize(horizontal: true, vertical: true)    // Viewサイズの固定化
            .foregroundColor(.green)    // 文字色
            //.kerning(5)  // カーニング(文字間)
                        // 正の値: 拡張, 負の値: 縮小
            //.fontWeight(.heavy)   // フォントの太さ
                            // .ultraLight
                            // .thin
                            // .light
                            // .regular
                            // .medium
                            // .semibold
                            // .bold
                            // .heavy
                            // .black
            //.underline(true, color: .red) // 下線(_: Bool, color: Color)
            //.strikethrough(true, color: .pink)    // 打ち消し線(_: Bool, color: Color)
            .lineSpacing(20)  // 行間
    }
}

struct ImageView: View {
    var body: some View {
        Image("dog")
            .resizable()    // // ImageViewのサイズを可変化(親Viewにサイズを合わせる)
            .aspectRatio(contentMode: .fit) // アスペクト比の指定
                                            // .fit - 画像全体を表示
                                            // .fill - 親View全体に表示
            //.renderingMode(.template) // 色の動的変更
                                        // .template - .foregroundColor(Color.red)で色の変更可能
                                        // .original - 色の変更不可
    }
}

struct ButtonView: View {
    var body: some View {
        Button(action: {
            print("tapped button")  // ボタンタップ時の操作
        }, label: {
            VStack {    // 子Viewを縦に配置
                Image(systemName: "camera") // ImageはSF Symbolsアイコンも使用可
                    .resizable()    // ImageViewのサイズを可変化
                    .aspectRatio(contentMode: .fit) // アスペクト比の指定
                    .frame(width: 40, height: 40, alignment: .center)   // アイコンのサイズ(タップ可能領域とは独立関係)
                Text("Tap this button")
            }
        })
        .frame(width: 150, height: 100, alignment: .center) // Buttonの.frame修飾子がタップ可能領域
        //.cornerRadius(10)   // 角丸化
        //.border(Color.pink) // 枠線の表示(第一引数はColor型インスタンス,第二引数widthは線幅)
        .overlay(   // 引数のViewを背面に表示
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 4)  // 輪郭の描画(第一引数: Color型インスタンス, 第二引数: 線幅)
        )
    }
}

struct PathView: View {
    var body: some View {
        Path { path in  // 二次元shapeを表現
            path.addLines([CGPoint(x: 0, y: 0), // 線の追加(始点の指定)
                           CGPoint(x: UIScreen.main.bounds.width, y: 0),    // 線の追加(x:画面の横幅分)
                           CGPoint(x: UIScreen.main.bounds.width / 2,   // 線の追加(x: 画面の横幅/2, y: 画面の縦幅/3)
                                   y: UIScreen.main.bounds.height / 3),
                           CGPoint(x: 0, y: 0)  // 線の追加(終点(始点)に向かって)
            ])
        }.stroke(Color.red, lineWidth: 4)
        Path { path in
            path.addRect(CGRect(x: (UIScreen.main.bounds.width - 100) / 2,  // 矩形の追加(x:始点のx座標, y:始点のy座標, width:幅, height:高さ)
                                y: 0,
                                width: 100,
                                height: 100))
        }.fill(Color.red)   // 塗りつぶし色の指定
    }
}

struct RectangleView: View {
    var body: some View {
        Rectangle() // 矩形の描画
            .foregroundColor(.gray) // 色の指定
            .frame(width: 100, height: 100) // サイズの指定
    }
}

struct SpacerView: View {
    var body: some View {
        Button(action: {
            print("tapped button")
        }, label: {
            HStack {
                Image("dog")
                Spacer()
                Image("dog")
            }
            //.onTapGesture { // タップイベントの追加(Spacerにはタップイベントが付与できないため、Buttonで包む)
            //    print("tapped")
            //}
        })
        HStack {
            Image("dog")
            Spacer()
            Image("dog")
        }
        .contentShape(Rectangle())  // Hit-Test領域(タップに反応する領域)の変更(引数はShape型View)
        .onTapGesture { // タップアクションはない
            print("tapped")
        }
    }
}

struct ListView: View {
    var body: some View {
        List {  // 1行ずつ子Viewを表示, スクロール可能
            HStack {
                Image(systemName: "moon")
                Text("moon")
            }
            HStack {
                Image(systemName: "sun.max")
                Text("sun")
            }
        }
    }
}

struct SectionView: View {
    var body: some View {
        List {
            Section(header: HStack {    // ヘッダーあり
                Image(systemName: "hare")
                Text("animal")
            }) {
                HStack {
                    Image(systemName: "moon")
                    Text("moon")
                }
                HStack {
                    Image(systemName: "sun.max")
                    Text("sun")
                }
            }
            Section {   //ヘッダーなし
                HStack {
                    Image(systemName: "gamecontroller")
                    Text("game")
                }
            }
        }
    }
}

struct NavigationViewView: View {
    var body: some View {
        NavigationView {    // Viewをスタックして階層的にナビゲーション
            List {
                Section(header: Text("Views")) {
                    NavigationLink(destination: SectionView()) {    // 遷移先の指定
                        Text("Text")
                    }
                }
            }
            .navigationBarTitle("Basic Views", displayMode: .inline)    // ナビゲーションバーの追加(第一引数:タイトル, 第二引数: タイトルの表示形式)
            // displayMode: ナビゲーションバーのスタイル
            // .inline - 標準
            // .large - 大きい
            // .automatic - 遷移元のナビゲーションバーを引き継ぐ
        }
    }
}

struct TabViewView: View {
    var body: some View {
        TabView {   // タブバー
            ListTestView()  // 遷移先のコンテンツ
                .tabItem {  // タブバーのアイテム
                    Image(systemName: "list.dash")
                    Text("List")
                }
            Text("Setting Page")    // 遷移先のコンテンツ
                .font(.largeTitle)
                .fontWeight(.heavy)
                .underline()
                .tabItem {  // タブバーのアイテム
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}
struct ListTestView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< 10) { index in
                    NavigationLink(destination: Text("detail: \(index) cell")) {    // 遷移先の指定(直接コンテンツを指定可能)
                                    HStack {
                                        Image(systemName: "heart.fill")
                                        Text("\(index)")
                                    }
                                   }
                }
            }.navigationBarTitle("Tab") // ナビゲーションバーの追加(第一引数:タイトル, 第二引数:タイトルの表示形式)
        }
    }
}

struct ScrollViewView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {  // 子Viewをスクロール可能化(第一引数:スクロール方向, 第二引数:インジケータの表示)
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        FixedSizeRectangle(color: .red)
                        FixedSizeRectangle(color: .red)
                    }
                }
                ScrollView(.horizontal) {
                    HStack {
                        FixedSizeRectangle(color: .yellow)
                        FixedSizeRectangle(color: .yellow)
                    }
                }
                ScrollView(.horizontal) {
                    HStack {
                        FixedSizeRectangle(color: .blue)
                        FixedSizeRectangle(color: .blue)
                    }
                }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}
struct FixedSizeRectangle: View {
    var color: Color
    var body: some View {
        Rectangle()
            .frame(width: 200, height: 100)
            .foregroundColor(color)
            .cornerRadius(20)
    }
}

struct TextFieldView: View {
    @State private var inputTextOne: String = ""    // Binding<String>型変数の定義
    @State private var inputTextTwo: String = ""    // Binding<String>型変数の定義
    var body: some View {
        VStack {
            TextField("input search keyword",   // 編集可能なテキストフィールド(第一引数:プレースホルダ, 第二引数:Binding型変数, 第三引数:入力開始時に呼び出されるクロージャ, 第四引数:入力終了時に呼び出されるクロージャ)
                      text: $inputTextOne,  // Binding<String>型変数の指定
                      onEditingChanged: {_ in
                        print("onEditingChanged")
                      },
                      onCommit: {
                        print("onCommit")
                      })
                .textFieldStyle(RoundedBorderTextFieldStyle())  // テキストフィールドのスタイル指定
                                                                // RoundedBorderTextFieldStyle - 角丸枠線
                                                                // PlainTextFieldStyle - 枠線なし
                .keyboardType(.twitter) // キーボード種類の指定(https://developer.apple.com/documentation/uikit/uikeyboardtype)
                                        // .asciiCapable - ASCII文字(標準)
                                        // .numbersAndPunctuation - 数値+句読点
                                        // .URL - URLエントリ用に最適化
                                        // .numberPad - 数値
                                        // .phonePad - 電話番号
                                        // .namePhonePad - 人名+電話番号
                                        // .emailAddress - メールアドレスエントリに最適化
                                        // .decimalPad - 小数点が入力可能な数値
                                        // .twitter - Twitterエントリに最適化(@ID,#ハッシュタグ)
                                        // .asciiCapableNumberPad - ASCII数字
                                        // .alphabet - アルファベット
            TextField("input numbers",
                      text: $inputTextTwo,
                      onEditingChanged: {_ in
                        print("onCommit")
                      })
                .textFieldStyle(PlainTextFieldStyle())
                .keyboardType(.decimalPad)
        }
    }
}

struct ViewPresentationView: View {
    @State private var isShowOkAlert: Bool = false  // アラート表示のフラグ
    var okAlert: Alert = Alert(title: Text("Download Success!"))    // アラートのコンテンツ
    var body: some View {
        VStack {
            Button(action: {
                isShowOkAlert = true
            }) {
                Image(systemName: "square.and.arrow.down")
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)
            }
            .alert(isPresented: $isShowOkAlert) { () -> Alert in    // View Presentation(特定の条件下で追加Viewを表示)
                                                                    // .alert - アラート(第一引数: Binding<Bool>型変数, 第二引数(クロージャ): 表示アラート)
                                                                    // .sheet - シート型モーダル表示
                                                                    // .actionSheet - 選択を催促するアクションシート
                okAlert
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ViewPresentationView()
    }
}