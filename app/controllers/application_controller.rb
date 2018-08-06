class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  add_flash_types :success,:danger, :info, :warning # используются для цветового отображения уведомлений при сохранении, удалении, изменении

  before_action :set_locale #перед любым экшеном выставить локаль

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale #или из параметров берём локаль или по стандартному зачению
  end


  # соединяем данную локаль со всеми входящими параметрами
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
