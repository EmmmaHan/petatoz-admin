class Store < ApplicationRecord
  include AASM

  has_many :services
  validates_presence_of :name_eng, :name_jp

  enum status: {
    pending: 'pending',
    activated: 'activated',
    deactivated: 'deactivated',
  }

  enum pet_type: {
    dog_only: 'dog_only',
    cat_only: 'cat_only',
    dog_and_cat: 'dog_and_cat',
    all_types: 'all_types'
  }

  aasm :status, column: :status, enum: true do
    state :pending, initial: true
    state :active
    state :deactivated

    event :activate do
      transitions from: :pending, to: :active
    end

    event :deactivate do
      transitions from: :active, to: :deactivated
    end
  end

end