class ApplicationController < ActionController::Base
  #after_filter :flash_to_headers

  def flash_to_headers
    return unless request.xhr?
    msg = flash_message
    msg = msg.gsub("ä", "&auml;").gsub("ü", "&uuml;").gsub("ö", "&ouml;").gsub("Ä", "&Auml;").gsub("Ü", "&Uuml;").gsub("Ö", "&Ouml;").gsub("ß", "&szlig;")
    response.headers['X-Message'] = msg
    response.headers["X-Message-Type"] = flash_type.to_s
    flash.discard
  end

  def flash_message
    [:error, :warning, :notice].each do |type|
      return flash[type] unless flash[type].blank?
    end
    return ''
  end

  def flash_type
    [:error, :warning, :notice, :keep].each do |type|
      return type unless flash[type].blank?
    end
    return :empty
  end
end
