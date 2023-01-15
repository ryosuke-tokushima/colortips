# colortips

### 画面遷移図
Figma：https://www.figma.com/file/xFsgBU4905xIsTylMj08X5/Untitled?node-id=0%3A1&t=sIhyw7LAy8qumqi2-1

■ サービス概要
　普段の服の色の組み合わせ、インテリアの配色等々
　色使いに困った人たちがこのサービスを使うことで
　配色のヒントを得られるサービスです


　■メインのターゲットユーザー
　全世代・服やインテリアの配色のヒントを得たい人達

　■ユーザーが抱える課題
　例えば服のコーディネートの配色って結構マンネリ化しがち（極端に言って仕舞えば白と黒みたいな）で、いざしてみようとしてもなかなか冒険できなかったりする
　〇〇のキャラクターっぽい服ってなるとなんだかコスプレみたいになってしまう
　インテリアの配色がパッとしない
　など
　

　■解決方法
　ColorTipsを使えば、好きな画像（キャラクターや風景）から色を抽出して、その抽出された色を参考に明日のコーディネートを考案・インテリアの配色のヒント・花束の組み合わせのアイデアを得られ、ユーザーは画像から抽出された色群（カラーパレット）と共に服やインテリア等の画像をシェアできる

　■実装予定の機能（以下の例は実際のアプリの機能から一部省略しています）
　
　・ログイン前
　　　・ユーザー登録
　　　　　・ユーザー名、メールアドレス、パスワード設定ができる
　　　・ログイン
　　　　　・メールアドレス、パスワードの入力画面が表示される
     ・LPページを閲覧できる
     ・画像をアップロードしてその画像の色を抽出し、それを編集してオリジナルのカラーパレットが作成できる
     ・他ユーザーが投稿したもの（カラーパレット含む）を閲覧できる
     ・他ユーザーが投稿したものの詳細を閲覧できる
        ・カラーパレットが閲覧できる
        ・その投稿に紐づいた写真を閲覧できる
        ・その投稿についたコメントが閲覧できる
        ・物（例えば服）のリンクが表示できる
     ・他ユーザーが投稿したカラーパレットから関連する色を含む投稿を検索できる
     ・色の名前からその色に関連した投稿一覧が閲覧できる
　　　

　・ログイン後
　　　・プロフィールの編集
        ・ユーザー名、メールアドレス、パスワードの編集、bioの編集、及びユーザーアイコンの編集ができる
     ・マイページを閲覧できる
        ・保存したカラーパレットの閲覧＆編集、自身の投稿一覧（削除）、likeした他人の投稿一覧を閲覧できる
 　  ・ログアウトできる
     ・任意の画像をアップロードしてその画像の色を抽出し、それを編集してオリジナルのカラーパレットが作成＆名前をつけて保存できる
　　　・投稿ができる
        ・投稿の本文が入力できる
        ・投稿にカラーパレットを設定できる
        ・投稿に画像を挿入できる
        ・投稿の画像に載っている物のリンクが貼れる
     ・他ユーザーが投稿したものの詳細を閲覧できる
        ・カラーパレットが閲覧できる
        ・その投稿に紐づいた写真を閲覧できる
        ・その投稿についたコメントが閲覧できる
        ・その投稿に使われた物（例えば服）のリンクが表示できる   
　　　・他ユーザーの投稿にコメントできる
     ・他ユーザーの投稿にLikeを付けられる
     ・他ユーザーが投稿したカラーパレットから関連する色を含む投稿を検索できる
     ・色の名前からその色に関連した投稿一覧が閲覧できる
　・管理ユーザー
　　　・ユーザー管理（一覧、詳細、編集、削除ができる）
     ・投稿の管理（一覧、詳細、作成、編集、削除ができる）
　　　

　■なぜこのサービスを作りたいのか？
　色から服を探すというアプローチにより、例えば今まで服に興味なかった人もこのサービスからアイデアを得て服に少しでも興味を持ってくれる人が増えればいいなと思ったためこれを考案しました。
　ちなみに最初はキャラクターの配色から服装を組めば『〇〇のキャラクターっぽい服装』みたいな簡易コスプレみたいなものができるだろうな、と思ったところから始まってます。
　またキャラクターに拘らず、例えば昨日撮った綺麗な風景とかから色のヒントを得て服の色の組み合わせのヒントを得る、みたいなものでもいいかなと思ってます。
　ちなみにこれは前述したように服だけじゃなくて色にまつわるもの全てに適応可能です。（インテリア等）
　肝心の色抽出方法に関してはimmagaという色抽出APIを使用します。

　■スケジュール

　▼スケジュール
　企画〜技術調査：1/15〆切
　README〜ER図作成：1/20 〆切(ER図は並行して作成してるのでスケジュール的に可能です)
　メイン機能実装：1/20 - 1/15
　β版をRUNTEQ内リリース（MVP）：2/15 〆切
　本番リリース：2月末~3月初旬