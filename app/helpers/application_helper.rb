module ApplicationHelper

def show_user_bg
  unless current_user.bg.blank?
    "background : no-repeat fixed left top url(#{current_user.bg})"
  end
end

def show_user_profile_bg
  unless current_user.profile_bg.blank?
    "background : no-repeat fixed left top url(#{current_user.profile_bg})"
  end
end

end
