class TypesController < ApplicationController
    before_action :authenticate_user!
    
    
    def index
        @types = current_user.types
    end
    
    def new
        @type = Type.new
    end

    def create
        @type = current_user.types.build(type_params)
        if @type.save
            redirect_to types_path
        else
            redirect_to new_type_path
        end
    end

    def show
        @type = current_user.categories.find_by(id: params[:id])
            if @type
                @courses = current_user.courses.where(type_id: params[:id])
                render :show 
            end
    end

    private

    def type_params
        params.require(:type).permit(:style, :user_id, :course_id)
    end
end
