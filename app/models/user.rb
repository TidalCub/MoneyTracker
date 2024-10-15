class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :transactions
  has_and_belongs_to_many :groups
  after_create_commit :create_default_group

  def create_default_group
    @group = Group.create(name: 'Personal', user_ids: [id], group_type: 'personal')
  end
end
