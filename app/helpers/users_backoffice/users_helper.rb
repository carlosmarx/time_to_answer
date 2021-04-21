module UsersBackoffice::UsersHelper
  def avatar_url
    avatar = current_user.user_profile.avatar
    avatar.attached? ? avatar : "https://via.placeholder.com/150"
  end
  
end
