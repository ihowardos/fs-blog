class Blog < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { in: 5..40 }
  validates :text, presence: true, length: { in: 120..1000 }
end
