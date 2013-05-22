module ApplicationHelper

def show_user_bg(user)
  if user.nil?
    user = current_user
  end
    unless user.bg.blank?
      "background : no-repeat fixed left top url(#{user.bg})"
   end
end

def show_user_profile_bg(user)
  unless user.profile_bg.blank?
    "background : no-repeat fixed left top url(#{user.profile_bg})"
  end
end

end
