class Timetable < ActiveRecord::Base
  belongs_to :teacher, class_name: "User"
  belongs_to :student, class_name: "User"

  enum status: { open: "open", closed: "closed" }

end

