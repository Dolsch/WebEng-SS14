module ApplicationHelper

  def userLabel(user)
    "#{user.name} (#{user.email})"
  end

end
