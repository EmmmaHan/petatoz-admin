class Pet < ApplicationRecord
  validates :age_xor_birthday
  validates_numericality_of :weight_kg, less_than_or_equal_to: 100

  enum pet_type: {
    dog: 'dog',
    cat: 'cat',
    others: 'others'
  }

  enum neutered: {
    unknown: "unknown",
    neutered: "neutered",
    not_neutered: "not_neutered"
  }

  private

  def age_xor_birthday
    if age.nil? and birthday.nil?
      errors.add(:base) << "Should specify age or birthday."
    end
  end
end