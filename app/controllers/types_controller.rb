class TypesController < ApplicationController
    def index
        binding.pry
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

    private

    def type_params
        params.require(:type).permit(:style, :user_id, :course_id)
    end
end
