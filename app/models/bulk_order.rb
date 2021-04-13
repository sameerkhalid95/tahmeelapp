class BulkOrder < ApplicationRecord
  has_many :orders

  before_create :generate_reference_number

  private
  def generate_reference_number
    self.reference_number = loop do
      random_token = SecureRandom.hex(8)
      break random_token unless BulkOrder.exists?(reference_number: random_token)
    end
  end
end
