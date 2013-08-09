class User < ActiveRecord::Base
  has_one :widget
  before_create :set_unique_key

  def set_unique_key
    self.unique_key = SecureRandom.hex(5)
  end
end
