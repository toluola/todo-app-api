class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]
    include Response

    def index
        @todos = Todo.all
        json_response(@todos)
    end

    private

    def set_todo
        @todo = Todo.find(params[id])
    end
end
