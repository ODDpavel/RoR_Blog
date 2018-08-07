class Tagging < ApplicationRecord
  belongs_to :post #  соединяемся с таблицей post
  belongs_to :tag #  соединяемся с таблицей tag
end
