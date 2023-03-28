class PetBreed < ApplicationRecord
  validates_presence_of :pet_type, :breed_name
  enum pet_type: {
    dog: 'dog',
    cat: 'cat',
    others: 'others'
  }
end