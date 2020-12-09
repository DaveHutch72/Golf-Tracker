class CoursesController < ApplicationController
    before_action :set_course, only: [:show, :edit, :update, :destroy]
    
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
            render :new
        end
    end

    def update
        if @course.update(course_params)
            redirect_to course_path(@course)
        else
            render :edit
        end
    end

    def destroy
        @course.destroy
        redirect_to courses_path
    end

    def played
        @courses = current_user.courses.played
    end

    private

    def set_course
        @course = current_user.courses.find_by(id: params[:id])
        if !@course
            redirect_to courses_path, notice: "You don't have access to this page."
        end
    end

    def course_params
        params.require(:course).permit(:name, :user_id, :played, :type_id, type_attributes: [ :style ])
    end
end
