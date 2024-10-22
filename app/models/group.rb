class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :transactions, dependent: :destroy

  enum group_type: %i[shared personal]

  def join_code_expired
    return true if join_code.nil? || join_code_expiry.nil? || join_code_expiry > Time.now

    false
  end
end
