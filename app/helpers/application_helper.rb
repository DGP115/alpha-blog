# frozen_string_literal: true

# Methods used in View pages
module ApplicationHelper
  # --
  # Create a funny avator for each user, using a hash of their username
  def avatar_for(user, options = { size: '300x300' })
    email_address = user.email_address.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    robot_url = "https://robohash.org/#{hash}.png/bgset_any?size=#{size}"
    image_tag(robot_url, alt: user.username, class: 'rounded-circle shadow')
  end

  def current_user
    # If @current_user has already been defined, return it; else, and only if
    # session[:current_user_id] is not nil, create it
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def logged_in?
    if current_user
      true
    else
      false
    end
  end
end
