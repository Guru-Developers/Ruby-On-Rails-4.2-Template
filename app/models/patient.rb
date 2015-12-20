class Patient < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}
  validates :hospital, presence: true, length: {maximum: 50}
end
