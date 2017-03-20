module ApplicationHelper
  
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "circle responsive-img")
  end
  
  # check if the user is in admin panel
  def admin?
    controller.class.name.split("::").first=="Admin"
  end
  
  def admin_todo
    admin_todo = ['articles','games','users']
    return admin_todo
  end
  
end
