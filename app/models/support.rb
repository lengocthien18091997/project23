class Support < ActiveRecord::Base
  belongs_to :user

  enum status: { open: "open", processing: "processing", closed: "closed" }

  validates :category, :comment, presence: true
end

