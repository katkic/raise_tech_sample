module UsersHelper
  def set_image(user_picture)
    user_picture.present? ? user_picture.url : 'default_user_picture.png'
  end
end
