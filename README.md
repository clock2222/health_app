# README

# タイトル

不健康レシピ

# リンク

https://intense-oasis-72713.herokuapp.com/

# 概要説明

● 簡単な説明
「不健康レシピ」は、体の不調や悩みを生活習慣から原因を探るヘルスケアアプリケーションです。

● 画像による説明

●ER 図
![image](https://p8.f1.n0.cdn.getcloudapp.com/items/6quE2e1j/feda3337-f0cf-482d-b435-bc3c1d119efa.png?v=133615fa2d8281a6dfefc7ec20d63844)

●AWS 構成図

# 開発理由

不健康レシピは健康をテーマに扱ったアプリケーションサービスです。
健康をテーマに扱った理由は務めていた介護という業界で学んだ事にあります。

私は 11 年間介護の業界に勤めて健康管理を自他ともに行なってきました。健康管理は 75~100 歳以上の高齢者を中心に、職場では 20~60 歳以上の仲間と私自身の体も含めて健康についての理解を深めてきました。

ご利用者様の症状から原因を探る事の他に、時には自分自身の体で再現を行なったり、チームで運営するにあたって同僚の健康の変化に気を配ったりなどもしてきました。

その中で気がついた事は、年齢による健康意識の違いと概ね年齢毎に同じ認識に至るということ。また、健康を害してからだと元の健康状態に戻ることが高年齢になるほど難しくなり悪循環に陥りやすいこと。そして、わかっていてても健康の管理や継続が困難であり、癒しを求めるはずが無意識に自身の健康を害している状況が珍しくないという事でした。

これらの問題点とは、本来１時間で済む仕事量を倍以上かけてしまうという効率の低下など時間を浪費してしまうという事にあります。仕事しかり勉強しかり遊びしかり、本来できることをできなくしてしまう事が健康を害する問題点だと感じました。

これらの理由から健康をテーマとして扱う事が身近で世の中に貢献できる重要なサービスだと感じました。

健康をテーマとして扱うにあたり、体調を崩すしてからでは遅いため健康意識の低い人にこそ届けたいサービスである事から、名称の通り「不健康」という視点でサービスを考えました。

健康とは対照的な不健康を掲げることで、健康に関して興味・関心を示さない層にも届けたい狙いがあります。その理由としては単純なもので、世の中の注目・関心を集める事柄は good ニュースより、bad ニュースの方が強いという心理を考慮しました。

そのため「健康のために ○○ をする」というアプローチよりも「○○ すると ○○ の健康がやばい」というような危機感を持たせる方向性でアプリ開発を進めました。

健康をテーマに扱うと「いかにその情報が正しいか」という部分が重要に感じていましたが、SNS の特徴を活かし「情報の正確性 < ケースの類似性」を追求する形としました。

それは「どれだけ正しいか」ではなく、「自分と同じ状況だから正しいかもしれない」という"自発的な気づき"を提供します。

そのため、例え少々オカルトで整合性の取れていない内容であってもユーザーの投稿した「不健康を形造るための自慢の悪習慣（レシピ）」をありのままを提供してもらいます。

そして、同じケースの数だけ情報が正確になるという流れをイメージしました。

# ストーリー

# 使用技術

<!-- 下記は予定のもの -->

言語 HTML/CSS/Javascript/Ruby/JQury/
フレームワーク Ruby on Rails/Bootstrap
DB postgresql
テストフレームワーク RSpec
デプロイ heroku

<!-- CircleCI
AWS/本番環境（EC2, RDS, VPC, EIP, Route53, IAM, S3）
Docker,Docker-compose（開発環境） -->

# 機能一覧

ログイン機能
ゲストログイン機能
管理者画面機能
投稿機能
画像投稿機能
コメント機能
タグ機能
グラフ機能
いいね機能
お問い合わせフォーム
テストコード（RSpec）

# 開発環境

OS macosX
IDE vscode
terminal iterm2

# インストール方法

# 活動記録

https://qiita.com/List202

# 今後の予定

変数名(特にグラフの各項目)
初期データの作成
テストコードの追加
Rubocop の違反の修正
全体的なリファクタリング
root の修正
デフォルト画像の修正（posts/show）
