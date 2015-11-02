namespace :play_auth do
  desc '数据库里预置用户 密码：1'
  task :create_data => [:environment] do
    require File.expand_path("../../../sample_data/script/create_users.rb",__FILE__)
    PlayAuth::CreateUsers.import
  end
end