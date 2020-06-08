class Cookie < ActiveRecord::Base
  belongs_to :storage, polymorphic: :true

  validates :storage, presence: true

  before_create :set_cooking_status
  after_commit :cook!, on: :create

  enum status: { cooking: 0, ready: 1 }

  EMPTY_FILLING_TEXT = 'no filling'

  private

  def set_cooking_status
    self.status = Cookie.statuses[:cooking]
  end

  def cook!
    CookCookieWorker.perform_in(5.minutes, id)
  end
end
