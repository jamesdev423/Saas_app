module MessagesHelper
  def recipients_options
    s = ''
    User.all.each do |user| #need to add code so users can only send messages to users with plan 2
      s << "<option value='#{user.id}' data-img-src='#{gravatar_image_url(user.email, size: 50)}'>#{user.first_name} #{user.last_name}</option>"
    end
    s.html_safe
  end
end