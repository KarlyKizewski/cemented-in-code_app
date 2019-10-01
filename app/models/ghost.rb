class Ghost < ApplicationRecord
  validates :person, presence: true, length: { maximum: 100, minimum: 3 }
  validates :eulogy, presence: true, length: { maximum: 600, minimum: 3 }
end
