module ApplicationHelper

  def arts_worker?(user)
    user.arts_worker
  end

  def user_profile
    current_user = @user
  end

  def owner?(model)
    current_user.id == model.user_id
  end

end
