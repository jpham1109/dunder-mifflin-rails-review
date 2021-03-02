class DogsController < ApplicationController
    before_action :find_dog, only: [:show, :sort]
     
    def index
        @dogs = Dog.all
    end

    def show
        
    end

    def sort
        @sorted_dogs = Dog.all.sort_dog
        redirect_to sort_path
    end

    private

    def find_dog
        @dog = Dog.find(params[:id])
    end
end
