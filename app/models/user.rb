class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :email
  has_many :auctions, through: :bids
  has_many :bids

  def is_auctioneer?
  	current_user.auctioneer?
	end
end
