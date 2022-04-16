class Baby < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :gender_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :birthday
  end
end

