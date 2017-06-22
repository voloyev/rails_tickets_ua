module MessagesHelper
  def recipients_options(chosen_recipient = nil)
    s = ''
    User.all.each do |user|
      next if user.id == current_user.id
      s << "<option value='#{user.id}' #{'selected' if user == chosen_recipient}> #{user.name}</option>"
    end
    s.html_safe
  end
end
