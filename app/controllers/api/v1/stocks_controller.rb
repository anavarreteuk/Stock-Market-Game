class Api::V1::StocksController < ApplicationController

def index
        @stocks = Stock.all
        render json: @stocks
    end

    def show
        @stock = Stock.find_by(id: params[:id])
        if @stock
            render json: @stock
        else
            render json: {error: 'Stock not found.'}, status: 400
        end
    end

    def create
        @stock = Stock.new(stock_params)
        if @stock.save
            render json: @stock
        else
            render json: {error: 'Unable to create stock'}, status: 400
        end
    end

    def destroy
        @stock = Stock.find_by(id: params[:id])
        if @stock
            @stock.destroy()
            render json: {message: 'Stock Sold!'}
        end
    end

    private

    def stock_params
        params.require(:stock).permit(:name, :price, :user_id)
    end

end
