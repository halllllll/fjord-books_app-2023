# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :set_locale

  def default_url_options
    { locale: I18n.locale }
  end

  private
  def set_locale
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale locale do
      yield
    end
  end
end
