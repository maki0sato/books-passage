# README

# BOOKS PASSAGE  
[![Image from Gyazo](https://i.gyazo.com/7ded93772744822bb96c061b9682e341.jpg)](https://gyazo.com/7ded93772744822bb96c061b9682e341)  


# アプリケーション概要と目指した課題解決
このアプリケーションは読んだ本をまとめて感想を共有し、次に読む本を探すというアプリケーションです。


**ペルソナ**  
老若男女問わず本が好きな人  

**目指した問題解決**  
・本の内容をより深く心に残したい人  
・感想を共有したいけど身近に共有できる人がいない人、恥ずかしい人  
・いつも同じ作家の本ばかりで違う作家の本を探している人  


# URL
http://books-passage.herokuapp.com/

Basic認証  
ichiro  
5151

ヘッダー内の*ゲストログイン*をクリックすれば、ゲスト用アカウントにログインできます。

# 利用方法
ログインをすることで、感想投稿機能、コメント機能、フォロー機能、いいね機能、アプリ内検索機能が使用できるようになります。  

投稿機能で本をまとめ、コメント機能で感想を共有、いいね機能で興味がある本をリストアップ、アプリ内検索でさらに本を探し、Amazon検索機能から本の購入。この流れの繰り返しを想定しています。

# 洗い出した要件  
・ユーザ管理を行うためのユーザー管理機能  
・本の感想を共有するための感想投稿機能  
・感想を一覧で見ることができるようにするための感想一覧表示機能  
・他のユーザーが感想を読むための感想詳細表示機能
・投稿者が感想を編集するための感想編集機能  
・投稿者が感想を削除するための感想削除機能  
・感想を閲覧した人たち、投稿者が本について話すためのコメント機能  
・コメントをした人がコメントを削除するためのコメント削除機能  
・本を探すためのアプリ内検索機能  
・本をジャンルから探すためのジャンル別表示機能  
・読むことを決めた本をその場で購入するためのAmazon検索機能  
・気になる本をチェックしておくためのいいね機能  
・ユーザー同士でフォローし合うためのフォロー機能  
・ユーザーのプロフィールや投稿、チェックした本を閲覧できるようにするためのユーザー詳細ページ表示機能

# 実装した機能
**フォロー機能**  
ユーザーをフォローすることでトップページにフォローした人の投稿が新しいものから順番に一覧表示されます。  
![demo](https://gyazo.com/e2d387b3891d9a9a477179e13be1a008)  
  


**いいね(しおり)機能**  
感想を読んで気になった本にしおりを挟むことでマイページにて一覧で表示されます。  
[![Image from Gyazo](https://i.gyazo.com/c4f2a12a552e0541833e00bb9e836574.gif)](https://gyazo.com/c4f2a12a552e0541833e00bb9e836574)  
  


**ネタバレ防止機能**  
感想の表示、非表示が切り替えることができます。  
[![Image from Gyazo](https://i.gyazo.com/51c932637d737d4c1f521ba00bd274c0.gif)](https://gyazo.com/51c932637d737d4c1f521ba00bd274c0)  
  


**コメント機能**  
投稿にコメントをすることができます。  
[![Image from Gyazo](https://i.gyazo.com/9738a86736e357b22c65585e4b3dbbe5.gif)](https://gyazo.com/9738a86736e357b22c65585e4b3dbbe5)  
  


**アプリ内検索機能**  
ヘッダー内の検索フォームから、タイトルと作家名で検索できます。  
[![Image from Gyazo](https://i.gyazo.com/a14e0a359a372ffd0a23b17d759ba94c.gif)](https://gyazo.com/a14e0a359a372ffd0a23b17d759ba94c)  
  


**ジャンル別表示機能**  
ヘッダー内のプルダウンから、ジャンルを選択し、検索することで指定したジャンルの投稿のみ全てを表示します。  
[![Image from Gyazo](https://i.gyazo.com/854540ee9e0ba718682b9248a00b7516.gif)](https://gyazo.com/854540ee9e0ba718682b9248a00b7516)  
  


**Amazon検索機能**  
読みたい本をサイドバーの検索フォームから直接Amazonの購入ページに遷移することができます。  
[![Image from Gyazo](https://i.gyazo.com/d07d8a02320065f9ef3064e3cf2d4926.gif)](https://gyazo.com/d07d8a02320065f9ef3064e3cf2d4926)  
  


# データベース設計  
[![Image from Gyazo](https://i.gyazo.com/2effd4e6ab4d550f69b2e8176d4c622e.png)](https://gyazo.com/2effd4e6ab4d550f69b2e8176d4c622e)  



# ローカル環境での動作方法  
    % git clone https://github.com/maki0sato/books-passage  
    % cd books-passage
    % bundle install
    % yarn install
    % rails db:create
    % rails db:migrate
    % rails s
  
Ruby 2.6.5  
RubyGems 3.0.3  
Rails 6.0.4.1  
MySQL 5.6.51  
Heroku 7.59.0  
Git 2.30.1
