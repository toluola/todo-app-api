class ItemsController < ApplicationController
    before_action :set_todo
    before_action :set_todo_items, only: [:show, :update, :destroy]
    include Response
    include ExceptionHandler

    def index
        json_response(@todo.items)
    end

    def create
       @todos = @todo.items.create!(todo_params)
        json_response(@todos, :created)
    end

    def show
       json_response(@items)
    end

    def update
        @items.update(todo_params)
        head :no_content
    end

    def destroy
        @items.destroy
    end

    private

    def todo_params
        params.permit(:name, :done)
    end

    def set_todo
        @todo = Todo.find(params[:todo_id]) 
    end

    def set_todo_items 
        @items = @todo.items.find_by!(id: params[:id]) if @todo
    end
end
