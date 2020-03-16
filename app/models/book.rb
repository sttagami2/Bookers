class Book < ApplicationRecord
  belongs_to :user, optional: true
  # userモデルと紐付ける
end
