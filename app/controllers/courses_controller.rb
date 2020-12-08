class CoursesController < ApplicationController
    def index
        @courses = current_user.courses.uniq
    end
    
    def new
        @course = Course.new
    end
    
    def create
        @course = current_user.courses.build(course_params)
        if @course.save
            redirect_to courses_path(@course)
        else
            redirect_to new_course_path
        end
    end

    private

    def course_params
        params.require(:course).permit(:name)
    end
end
