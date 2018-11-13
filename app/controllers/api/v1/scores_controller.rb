class Api::V1::ScoresController < ApplicationController

def index
        @scores = Score.all
        render json: @scores
    end

    def show
        @score = Score.find_by(id: params[:id])
        if @score
            render json: @score
        else
            render json: {error: 'score not found.'}, status: 400
        end
    end

    def create
        @score = Score.new(score_params)
        if @score.save
            render json: @score
        else
            render json: {error: 'Unable to create score'}, status: 400
        end
    end

    def destroy
        @score = Score.find_by(id: params[:id])
        if @score
            @score.destroy()
            render json: {message: 'Done!'}
        end
    end

    private

    def score_params
        params.require(:score).permit(:symbol, :bid, :ask, :price)
    end

end
