class TypesController < ApplicationController
    def new
        @type = Type.new
    end

    def create
        @type = current_user.rounds.build(type_params)
        if @type.save
            redirect_to types_path
        else
            render :new
        end
    end

    private

    def type_params
        params.require(:type).permit(:score)
    end
end
