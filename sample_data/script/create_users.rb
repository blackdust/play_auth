module PlayAuth
  class CreateUsers
    def self.import
      users = [
        {email:'a@a.com',name:'开发者A',password:'1',password_confirmation:'1',image:'http://i.teamkn.com/i/sUg4zAFR.png'},
        {email:'b@b.com',name:'开发者B',password:'1',password_confirmation:'1',image:'http://i.teamkn.com/i/o05ruClg.png'},
        {email:'c@c.com',name:'开发者C',password:'1',password_confirmation:'1',image:'http://i.teamkn.com/i/lqMO8pxp.png'},
        {email:'d@d.com',name:'开发者D',password:'1',password_confirmation:'1',image:'http://i.teamkn.com/i/g1Wmlwpm.png'},
        {email:'e@e.com',name:'开发者E',password:'1',password_confirmation:'1',image:'http://i.teamkn.com/i/bx69U4p3.png'},
      ]
      users.each do |user|
        developer = User.new(user)
        developer.save
        p developer.valid?
        p developer.errors
        p 'success'
      end
    end
  end
end
