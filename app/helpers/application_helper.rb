module ApplicationHelper

  def user_profile
    current_user == @user
  end

  def owner?(model)
    current_user.id == model.user_id
  end

  def following?(user)
    current_user.followed_users.include?(user)
  end

  def friends?(user)
    current_user.friends.include?(user)
  end

  def friendee?(user)
    current_user.friended_users.where(user)
  end

end
