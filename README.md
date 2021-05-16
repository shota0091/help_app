## アプリ名
たすけあい

## 制作期間
- 1月1日〜4月30日

## 概要
- 本サイトは、金銭ではなく体験経験を提供することでgive and takeを目指す検索サイトであります


## 本番環境
- http://54.250.78.44/
# ログイン機能
- ゲストログインのボタンをクリックしていただければゲスト用のアカウントでログインすることができます。
あるいはトップページの新規登録から、ユーザー情報を登録することで利用可能になります

## 制作背景
- お金を扱った副業サイトが多く、お金以外の体験や経験と言った目に見えないものを提供できたら、豊かに慣れるのではと思い制作しました。

## 工夫したポイント
- 通知機能
作成して、JQueryで呼び出せたものは良いものの、rails-ujsとJQueryが混同してうまく起動できなかった。
そこで、通知機能を司っているコントローラーにJSの動きを抑制するコードを追加して、混同を回避しました。
意外にも別ページをJSで呼び出す方法がネットを調べてもあまりなかったので抑制する方法まで辿りつかなかったので時間がかかりました


## 使用技術
# 言語
Ruby/Haml/SCSS/Javascript

# ワークフレーム
Ruby on Rails

# インフラ
AWS

# データベース
MySQL PG

# ソース管理
GitHub GithubDesktop


# エディタ
VSCode 

## 課題、今後実装したい機能
# 今後実装したい機能
- テストコード
- カレンダー機能
- リッチテキストエディッター機能
- 通知機能の確認、未確認が未実装

# 課題
- リファクタリングの観点から言ったら、内容がめちゃくちゃなのでもう少しコードに対する理解度が必要と思った。
- Qiita頼りになってしまった点

## DB設計
# userテーブル
|Column|Type|Options|
|-------|-----|-------|
|name|string|null: false|
|email|string|null: false|
|image|string||
|explanation|string||
|address_id|integer||
|age|integer||

- has_many :posts
- has_many :comments
- has_many :likes
- has_many :lists
- has_many :entries
- has_many :rooms, through: :entries
- has_many :messages
- has_many :active_reviews, class_name: "Review",foreign_key: :reviewing_id
  has_many :reviewings, through: :active_reviews, source: :reviewer
- has_many :passive_reviews, class_name: "Review",foreign_key: :reviewer_id
- has_many :reviewers, through: :passive_reviews, source: :reviewing

- has_many :active_notifications, class_name: 'Notification', foreign_key: :visitor_id, dependent: :destroy
- has_many :passive_notifications, class_name: 'Notification', foreign_key: :visited_id, dependent: :destroy

- has_many :active_follows, class_name: "Like",foreign_key: :following_id
- has_many :followings, through: :active_follows, source: :follower
- has_many :passive_follows, class_name: "Like",foreign_key: :follower_id
- has_many :followers, through: :passive_follows, source: :following

# postテーブル
|Column|Type|Options|
|-------|-----|-------|
|title|string|null: false|
|explanation|string|null: false|
|image|string|null: false|
|obtain|string|null: false|
|address_id|integer|null: false|
|integer|integer|null: false|
|user|references|foreign_key: true|
|solution|string||

- belongs_to :user
- has_many :comments,dependent: :destroy
- has_many :post_tags, dependent: :destroy
- has_many :tags, through: :post_tags
- belongs_to_active_hash :address
- belongs_to_active_hash :license

# tagsテーブル
|Column|Type|Options|
|-------|-----|-------|
|tag_name|string|null: false|

- has_many :post_tags, dependent: :destroy
- has_many :posts,through: :post_tags

# post_tagsテーブル
|Column|Type|Options|
|-------|-----|-------|
|tag|references|foreign_key: true|
|post|references|foreign_key: true|

- belongs_to :post
- belongs_to :tag

# commentsテーブル
|Column|Type|Options|
|-------|-----|-------|
|user|references|foreign_key: true|
|post|references|foreign_key: true|

- belongs_to :post
- belongs_to :user

# reviewsテーブル
|Column|Type|Options|
|-------|-----|-------|
|speedy|integer||
|kindness|integer||
|frantically|integer||
|reviewer|references|foreign_key: true|
|reviewing|references|foreign_key: true|

- belongs_to :reviewer, class_name: "User"
- belongs_to :reviewing, class_name: "User"

# roomsテーブル
|Column|Type|Options|
|-------|-----|-------|

- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy
- has_many :users, through: :entries
- has_many :notifications, dependent: :destroy

# entriesテーブル
|Column|Type|Options|
|-------|-----|-------|
|user|references|foreign_key: true|
|room|references|foreign_key: true|

- belongs_to :user
- belongs_to :room

# messagesテーブル
|Column|Type|Options|
|-------|-----|-------|
|user|references|foreign_key: true|
|room|references|foreign_key: true|
|messages|text||
|image|text||

- belongs_to :user
- belongs_to :room
- has_many :notifications, dependent: :destroy

# notificationsテーブル
|Column|Type|Options|
|-------|-----|-------|
|visitor|references|foreign_key: true|
|visited|references|foreign_key: true|
|room|references|foreign_key: true|
|message|references|foreign_key: true|
|action|string||
|cheaked|boolean||

- belongs_to :room, optional: true
- belongs_to :message, optional: true
- belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
- belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
  
# likesテーブル
|Column|Type|Options|
|-------|-----|-------|
|follower|references|foreign_key: true|
|following|references|foreign_key: true|

- belongs_to :follower, class_name: "User"
- belongs_to :following, class_name: "User"