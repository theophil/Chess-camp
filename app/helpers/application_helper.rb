module ApplicationHelper
	def app_helper_obtain_eligible_students(camp)
		active_students_for_rating = Student.active.alphabetical.at_or_above_rating(camp.curriculum.min_rating).below_rating(camp.curriculum.max_rating).to_a
	    students_already_registered =  camp.students.alphabetical.to_a
	    fully_eligible_students = active_students_for_rating-students_already_registered.to_a
	    fully_eligible_students = fully_eligible_students.map { |s| [s.name, s.id] }
	    fully_eligible_students	
	end
end
