class RoundsController < ApplicationController
    def new
        @round = Round.new
    end

    def create
        @round = current_user.rounds.build(round_params)
        if @round.save
            redirect_to rounds_path
        else
            render :new
        end
    end

    private

    def round_params
        params.require(:round).permit(:score)
    end
end
