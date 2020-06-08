class Oven < ActiveRecord::Base
  belongs_to :user
  has_many :cookies, as: :storage

  validates :user, presence: true

  def all_cookies_ready?
    cookies.all?(&:ready?)
  end
end
