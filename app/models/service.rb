class Service < ApplicationRecord
  belongs_to :store

  validates_presence_of :name

  enum service_type: {
    salon: 'salon',
    hotel: 'hotel',
    kindergarten: 'kindergarten',
    training: 'training',
    medical: 'medical',
    day_care: 'day_care',
    other: 'other'
  }
end