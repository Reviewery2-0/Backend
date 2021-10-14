class BreweriesController < ApplicationController
    def index
        render json: Brewery.all
    end

    def show
        brewery = Brewery.find(params[:id])
        render json: brewery
    end

    def create
        brewery = Brewery.new(brewery_params)
        if brewery.save
            render json: brewery, status: :created
        else
            render json: brewery.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        brewery = Brewery.find(params[:id])
        brewery.update(brewery_params)
        render json: brewery
    end

    def increment_likes
        brewery = Brewery.find(params[:id])
        if brewery
            brewery.update(likes: brewery.likes + 1)
            render json: brewery
        else
            render json: brewery.errors.full_messages, status: :unprocessable_entity
        end
    end

    def decrement_likes
        brewery = Brewery.find(params[:id])
        if brewery
            brewery.update(likes: brewery.likes - 1)
            render json: brewery
        else
            render json: brewery.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        brewery = Brewery.find(params[:id])
        brewery.destroy
    end

    private

    def brewery_params
        params.permit(:name, :location, :likes)
    end
end
