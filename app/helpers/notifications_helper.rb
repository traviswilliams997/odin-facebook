module NotificationsHelper
    def get_commenter(notification)
      User.find_by_id(notification[:params][:comment][:user_id]) 
    end
    def get_user(id)
      User.find_by_id(id) 
    end

    def get_users 
      @users = User.all
      @users

    end
  end