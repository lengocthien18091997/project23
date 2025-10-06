class Request < ActiveRecord::Base
  belongs_to :student, class_name: "User"
  belongs_to :teacher, class_name: "User"
  has_one :timetable, dependent: :destroy

  enum status: {
      open: "open",
      accepted: "accepted",
      rejected: "rejected",
      closed: "closed"
  }

  validates :subject, :budget, presence: true
  validates :budget, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

end

