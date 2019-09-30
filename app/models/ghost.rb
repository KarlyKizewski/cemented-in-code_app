class Ghost < ApplicationRecord
  validates :person, presence: true, length: { maximum: 75, minimum: 3 }
  validates :eulogy, presence: true, length: { maximum: 300, minimum: 3 }
end
