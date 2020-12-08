class CoursesController < ApplicationController
    def index
        @courses = current_user.courses
    end
    
    def new
        @course = Course.new(type_id: params[:type_id])
    end

    def show

    end
    
    def create
        binding.pry
        @course = current_user.courses.build(course_params)
        if @course.save
            redirect_to course_path(@course)
        else
            redirect_to root_path
        end
    end

    private

    def course_params
        params.require(:course).permit(:name, :user_id, :type_id, type_attributes: [ :style ])
    end
end
