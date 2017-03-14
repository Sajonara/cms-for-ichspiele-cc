module ApplicationHelper
  
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "img-circle")
  end
  
  # check if the user is in admin panel
  def admin?
    controller.class.name.split("::").first=="Admin"
  end
  
end
