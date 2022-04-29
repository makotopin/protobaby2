class Hospital < ApplicationRecord
  belongs_to :baby

  with_options presence: true do
    validates :hospitalname, :week, :phone
  end
end
