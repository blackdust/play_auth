# PlayAuth

这个 gem 目前用作简单的用户验证管理，在组件开发中替代厚重的devise
方便团队进行组件开发

组件开发规范参考：  
http://s.4ye.me/DE1J85


## 使用办法

在sample的 **Gemfile** 中添加引用
```ruby
# file ./Gemfile
gem 'play_auth', :github => 'mindpin/play_auth',
                 :tag => :latest

```

然后运行
```shell
bundle install
```

## 使用示例
由[codestart](https://github.com/mindpin/codestart)，生成的项目，可以看出最基本的使用形式：
```haml
.engine-generated
  .desc 
    %span rails engine 
    %strong second_gem 
    %span 已成功创建
  .desc 你可以继续进行组件开发了

.engine-generated
  - if user_signed_in?
    .desc.current-user
      %span 当前用户：
      %strong= current_user.name
  - else
    .desc
      %span 当前无登录用户

  .desc
    %span 访问
    %a{:href => '/auth'} /auth
    %span 注册
  .desc
    %span 访问
    %a{:href => '/auth/login'} /auth/login
    %span 登录
  .desc
    %span 点击
    %a{:href => '/auth/logout', :data => {:method => :delete}} DELETE /auth/logout
    %span 登出
```

### 主要helper方法为:
#### current_user
获取当前登录用户，未登录返回nil

#### user_signed_in?  
是否已经登录

#### sign_in(scope, user)  
使用user登录，scope为devise才用到，不熟悉的，这里传入 **:user** 即可

#### sign_out(resource_or_scope=nil)  
登出，传入参数为仿devise设计，不熟悉的，这里可以忽略
