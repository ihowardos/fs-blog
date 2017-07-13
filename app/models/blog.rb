class Blog < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { in: 5..40 }
  validates :text, presence: true

  def created_at_h
    created_at.strftime("%d %b. %Y %H:%M")
  end
end
