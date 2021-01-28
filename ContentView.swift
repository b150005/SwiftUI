//
//  ContentView.swift
//  Shared
//
//  Created by b150005 on 2021/01/14.
//

import SwiftUI
import MapKit

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
                                                    // データが値型 && 内部View自身でデータを保持・更新 -> @State(Property Wrapper)
                                                    // データが値型 && 外部Viewがデータを保持・更新
                                                    // ->   外部Viewでは@Stateで宣言
                                                    //      内部Viewでは@Bindingで宣言
                                                    // @Binding - 外部Viewからデータを渡され、内部Viewで更新する場合(使用時は$を付与)
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
    @State private var isShowErrorAlert: Bool = false   // アラート表示のフラグ
    @State private var isShowRetryAlert: Bool = false   // アラート表示のフラグ
    @State private var isShowSheet: Bool = false    // アラート表示のフラグ
    @State private var isShowActionSheet: Bool = false  // アラート表示のフラグ
    var okAlert: Alert = Alert(title: Text("Download Success!"))    // アラートタイトル
    var errorAlert: Alert = Alert(title: Text("An error occurred"), // アラートタイトル
                                  message: Text("Retry later!"),    // アラートメッセージ
                                  dismissButton: .destructive(Text("destructive")))   // ボタンスタイル
                                                                            // .cancel(_Text, action:) - 操作のキャンセル(別表示(一番下))
                                                                            // .default(_Text, action:) - デフォルト(青表示)
                                                                            // .destructive(_Text, action:) - 破壊的操作(赤表示)
    var retryAlert: Alert = Alert(title: Text("Error"),
                                  message: Text("please wait a minute"),
                                  primaryButton: .default(Text("Retry"),    // ファーストボタン(右配置)
                                                          action: { print("tapped retry button") }),
                                  secondaryButton: .cancel())               // セカンドボタン(左配置)
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
                                                                    // .sheet - シート型モーダル
                                                                    // .actionSheet - 選択を催促するアクションシート
                okAlert
            }
            Button(action: {
                isShowErrorAlert = true
            }) {
                Image(systemName: "play")
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)
            }
            .alert(isPresented: $isShowErrorAlert) { () -> Alert in
                errorAlert
            }
            Button(action: {
                isShowRetryAlert = true
            }) {
                Image(systemName: "person.badge.plus")
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)
            }
            .alert(isPresented: $isShowRetryAlert) { () -> Alert in
                retryAlert
            }
            
            Button(action: {
                isShowSheet = true
            }) {
                Image(systemName: "photo.on.rectangle")
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
            }
            .sheet(isPresented: $isShowSheet) { // シート型モーダル(isPresented - モーダル表示のフラグ)
                Button(action: {    // シート型モーダルのコンテンツ
                    isShowSheet = false // 遷移先でフラグをfalseに変更するとモーダルが閉じる
                                        // ※スワイプでも閉じる(=フラグをfalseに変更する)ことが可能
                }) {
                    Text("Dismiss")
                }
            }
            Button(action: {
                isShowActionSheet = true
            }) {
                Image(systemName: "car")
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
            }
            .actionSheet(isPresented: $isShowActionSheet) { () -> ActionSheet in
                ActionSheet(title: Text("交通手段"),
                            message: Text("利用するものを選んでください"),
                            buttons: [
                                .default(Text("自動車"), action: {
                                    print("自動車を選択")
                                }),
                                .default(Text("電車"), action: {
                                    print("電車を選択")
                                }),
                                .destructive(Text("徒歩"), action: {
                                    print("徒歩を選択。大変だよ。")
                                }),
                                .cancel(Text("選択しない"), action: {
                                    print("未選択")
                                }),
                            ])
            }
        }
    }
}

struct LazyStackView: View {
    var body: some View {
        ScrollView {
            LazyVStack {    // 画面外のViewは生成しない(->メモリ効率化)
                ForEach(0 ..< 100) { _ in
                    Image("dog")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}


let threeColumns = [
    GridItem(.fixed(100), spacing: 0),  // GridItem(_GridItem.Size, spacing:, alignment:) - rowやcolumnのセル
                                        // _GridItem.Size: セルサイズ
                                        // .fixed(_Int) - 指定数値で固定
                                        // .flexible - 可能な限り拡大(標準)
                                        // .adaptive - 可能な限り敷き詰める
                                        // spacing: 次セルとの間隔
    GridItem(.flexible(minimum: 10), spacing: 0),
    GridItem(.adaptive(minimum: 10), spacing: 0),
]
struct LazyGridView: View {
    let columns: [GridItem] // 呼び出し時に引数として定数threeColumsを指定
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {   // 縦のグリッド表示
                                                        // colums:([GridItem]の要素数)=(カラムのグリッド数),
                                                        // spacing: セル間隔)
                ForEach(0 ..< 100) { _ in
                    Image("dog")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

struct TextEditorView: View {
    @State private var text = ""
    var body: some View {
        TextEditor(text: $text)
            .foregroundColor(.red)  // 文字色
    }
}

struct ProgressViewView: View {
    var body: some View {
        ScrollView {
            ProgressView("Downloading...")  // 進捗ビュー(アクティビティインジケータ)
                                            // _ titleKey: LocalizedStringKey(ラベル)
                .padding()
            ProgressView("Downloading...", value: 30, total: 100)   // 進捗ビュー(プログレスバー)
                                                                    // _ titleKey: LocalizedStringKey(ラベル)
                                                                    // value: プログレスバーの現在値
                                                                    // total: プログレスバーの最大値
                .padding()
        }
    }
}

struct LinkView: View {
    @Environment(\.openURL) private var openURL // @EnvironmentにKeyPathでopenURLを指定
                                                // @Environment - View環境値の読み取り
                                                // 参照(https://developer.apple.com/documentation/swiftui/environmentvalues)
    let googleURL = URL(string: "https://google.com")!
    var body: some View {
        List {
            Link("google", destination: googleURL)  // URLを指定してデフォルトのWebブラウザを表示
                                                    // _titleKey: LocalizedStringKey(ラベル)
                                                    // destination: URL(URL)
            Link(destination: googleURL) {
                Label("google", systemImage: "link")    // テキストとアイコンを並列表示
                                                        // _titleKey: LocalizedStringKey(ラベル)
                                                        // systemImage: String(アイコンとなるSF Symbols)
            }
            Button(action: {
                openURL(googleURL)  // 指定したURLをWebブラウザで表示
            }) {
                Text("google with button")
            }
        }
    }
}

struct MapView: View {
    @State private var region = MKCoordinateRegion( // 緯度・経度・縮尺を有する構造体
        center: CLLocationCoordinate2D( // 緯度・経度を有する構造体
            latitude: 35.6593912,   // 緯度
            longitude: 139.7003861  // 経度
        ),
        span: MKCoordinateSpan(     // 縮尺(マップの幅と高さ)
            latitudeDelta: 0.01,    // マップに表示する緯度幅(範囲が広い方が優先される)
            longitudeDelta: 0.01    // マップに表示する経度幅(範囲が広い方が優先される)
        )
    )
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)    // セーフエリアを無視
    }
}

// 渡されるデータが値型の場合
struct ParentView: View {
    @State private var counter = 0  // 親View自身が保持する値型データには@Stateを付与
    var body: some View {
        HStack {
            ChildView(counter: $counter)    // 外部View(子View)に対しBinding型で渡す
                .frame(width: .infinity)
        }
    }
}
struct ChildView: View {
    @Binding var counter: Int   // 外部View(親View)から渡される値型データを@Bindingで宣言
    var body: some View {
        Button(action: {
            counter += 1
        }) {
            Text("\(counter)")
                .font(.title)
        }
    }
}

struct EnvironmentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme    // 列挙型ColorScheme - 配色に関するユーザ設定オプション
                                                                // .dark - ダークモード
                                                                // .light - ライトモード
                                                                // 参照(https://developer.apple.com/documentation/swiftui/environmentvalues)
    var body: some View {
        List {
            if colorScheme == .dark {
                Text("dark mode")
            } else if colorScheme == .light {
                Text("light mode")
            } else {
                Text("")
            }
        }
    }
}

// 渡されるデータが参照型の場合
final class DataSource: ObservableObject {  // SwiftUIによる監視対象クラスにはObservableObjectプロトコルに準拠させる
                                            // finalクラスにすることで、以下のメリットが生まれる
                                            // 1. データの参照先が変わらない
                                            // 2. インスタンスが保持するプロパティをcounterのみに保つことができる(サブクラスで継承できない)
    @Published var counter = 0  // 監視対象データには@Published(Property Wrapper)を付与
}
struct CounterView: View {
    @StateObject private var dataSource = DataSource()  // 監視対象クラスインスタンスdataSourceを生成
                                                        // 監視対象クラスインスタンスには@StateObjectを付与
                                                        // @StateObject - View自身で保持する参照型データオブジェクトに付与
    var body: some View {
        VStack {
            Button("increment counter") {
                dataSource.counter += 1
            }
            Text("count: \(dataSource.counter)")
        }
    }
}

// 親View→子Viewに渡されるデータが参照型の場合
final class DataSource2: ObservableObject {
    @Published var counter2 = 0     // 監視対象データには@Publishedを付与
}
struct ParentObjectView: View {
    @StateObject var dataSource2 = DataSource2()    // 親View自身が保持する参照型データには@StateObjectを付与
    var body: some View {
        ChildObjectView(dataSource2: dataSource2)
    }
}
struct ChildObjectView: View {
    @ObservedObject var dataSource2: DataSource2    // 外部Viewから渡される参照型データには@ObservedObjectを付与
    var body: some View {
        VStack {
            Button("increment counter2") {
                dataSource2.counter2 += 1
            }
            Text("count: \(dataSource2.counter2)")
        }
    }
}

// 親View→孫Viewに渡されるデータが参照型の場合
class DataSource3: ObservableObject {
    @Published var counter3 = 0 // 監視対象データには@Publishedを付与
}
struct ParentObjectView2: View {
    var body: some View {
        ChildObjectView2()
    }
}
struct ChildObjectView2: View {
    var body: some View {
        GrandChildView()
    }
}
struct GrandChildView: View {
    @EnvironmentObject var dataSource3: DataSource3
    var body: some View {
        Text("\(dataSource3.counter3)")
    }
}

struct StorageView: View {
    @SceneStorage("userName") private var userName: String = "" // シーン毎に保存するデータには@SceneStorageを付与
                                                                // シーンのデータはシステムによって管理されているため、EOLが不明
    @AppStorage("isLogin") private var isLogin = false  // @AppStorage - 値型データをデフォルトでUserDefaultsに格納するProperty Wrapper
                                                        // キー: isLogin
                                                        // UserDefaultsにデータが保存されるため、アプリ削除までデータが保存され続ける
    @State private var memo: String = ""    // シーンで保存されないため、再起動で初期化される
    var body: some View {
        List {
            TextField("Input your name", text: $userName)
            Toggle("Login", isOn: $isLogin)
            TextField("Input memo", text: $memo)
        }
    }
}

// Property Wrapperまとめ
// 値型データ
// @Binding - 外部Viewから渡されるデータに付与
// @State - ビューで管理するデータに付与
// @AppStorage - アプリで管理するデータに付与
// @SceneStorage - シーンで管理するデータに付与
// 参照型データ
// @StateObject - 親ビューで管理するデータに付与
// @ObservedObject - 子ビューで管理するデータに付与
// @EnvironmentObject - 環境で管理するデータに付与
// 環境値
// @Environment - 環境値に関するデータに付与

struct ContentView_Previews: PreviewProvider {
//    ChildObjectViewの呼び出し用
//    @StateObject static private var dataSource2 = DataSource2()   // 親View自身が保持する参照型データには@StateObjectを付与
                                                                    // 「静的変数」を表すstaticを付与
                                                                    // 「内部利用」を表すprivate(メンバのアクセス制御)を付与
//    ParentObjectView3の呼び出し用
//    @StateObject static private var dataSource3 = DataSource3()
    static var previews: some View {
        Group {
            StorageView()
            StorageView()
        }
//        ParentView().environmentObject(dataSource3)
//        LazyGridViewの呼び出し用
//        Group {
//            LazyGridView(columns: threeColumns)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//        }
//        ChildObjectViewの呼び出し用
//        ChildObjectView(dataSource2: dataSource2) // SwiftUIのライフサイクル
//                                                    // 1. Source of TruthをもとにChildObjectViewが生成
//                                                    // 2. ユーザに対してViewがレンダリング + Viewインスタンスが破棄
//                                                    // @ObservedObjectはViewインスタンスの破棄と同時にオブジェクトが破棄される
//                                                    // @StateObjectはViewインスタンスが破棄されてもSwiftUIによって保持される
//                                                    // 3. ユーザがUIイベントを発火 or 非同期イベントが発火
//                                                    // 4. Source of Truthの更新
//                                                    // 5. 1.へ戻る
    }
}
