class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments

  has_many :taggings # указывает на соединение один-ко-многим с другой моделью
  has_many :tags, through: :taggings # используется для настройки соединения многие-ко-многим с другой моделью
  # у 1 записси :post много записей в :tagging

  validates :title, :summary, :body, presence: true

  def all_tags
    self.tags.map(&:name).join(', ') # получение всех тегов и вывод через запятую
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create! # ищем тег по имени (либо нпходим, либо создаём)
    end
  end
end
