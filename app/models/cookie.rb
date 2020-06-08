class Cookie < ActiveRecord::Base
  belongs_to :storage, polymorphic: :true

  validates :storage, presence: true

  EMPTY_FILLING_TEXT = 'no filling'

  def ready?
    true
  end
end
