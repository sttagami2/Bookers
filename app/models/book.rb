class Book < ApplicationRecord
  belongs_to :user
  # userモデルと紐付ける
end
