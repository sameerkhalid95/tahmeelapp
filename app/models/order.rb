class Order < ApplicationRecord
  PICK_UP_LOCATIONS = ['Dubai', 'Abu Dahbi', 'Sharjah', 'Ras Al Khimah', 'Ajman', 'Fujerah', 'Umm Al Qwen'].freeze

  validates :drop_off, :pick_up, :weight, presence: true
  belongs_to :bulk_order, optional: true

  scope :filter_by_pick_up_and_date, lambda { |pick_up_location, today|
    where('pick_up = ? and sending_time::date = ?', pick_up_location, today)
  }
end
