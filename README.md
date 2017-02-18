##【项目说明】

    目前的功能包括：用户中心管理，后台视频管理，文件上传管理，视频评论管理

    最近重构了代码，将之前冗余的代码精简，适配了手机端浏览样式

## 【启动】

```ruby
bundle install
cp config/database.yml.example config/database.yml
cp config/setting.rb.example config/setting.rb
rake db:create
rake db:migrate
rake db:seed
````
修改配置文件database.yml setting.rb

