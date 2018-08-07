class Tag < ApplicationRecord

  has_many :taggings # указывает на соединение один-ко-многим с другой моделью
  has_many :posts, through: :taggings # используется для настройки соединения многие-ко-многим с другой моделью
  # у 1 записси :tag много записей в :tagging

  def self.counts
    self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end

end
