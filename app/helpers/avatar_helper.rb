module AvatarHelper
  def current_user_avatar(css_class: '')
    if current_user && current_user.avatar.present?
      cl_image_tag current_user.avatar, height: 100, width: 100, crop: :fill, class: css_class
    else
      image_tag "avatar_default.png", alt: "alttext", class: css_class
    end
  end
end
