class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :transactions, dependent: :destroy

  enum group_type: %i[shared personal]
end
