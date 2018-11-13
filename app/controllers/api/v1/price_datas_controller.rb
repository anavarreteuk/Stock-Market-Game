class Api::V1::PriceDatasController < ApplicationController
    def index
        @price_datas = PriceData.all
        render json: @price_datas
    end

    def show
        @price_data = PriceData.find_by(id: params[:id])
        if @price_data
            render json: @price_data
        else
            render json: {error: 'Price data not found.'}, status: 400
        end
    end

    def create
        @price_data = PriceData.new(price_data_params)
        if @price_data.save
            render json: @price_data
        else
            render json: {error: 'Unable to create price data'}, status: 400
        end
    end

    def destroy
        @price_data = PriceData.find_by(id: params[:id])
        if @price_data
            @price_data.destroy()
            render json: {message: 'Done!'}
        end
    end

    private

    def price_data_params
        params.require(:price_data).permit(:symbol, :bid, :ask, :price)
    end
end
