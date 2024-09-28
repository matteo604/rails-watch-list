class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    def index
      @lists = List.all
    end

    def show
    end

    def new
      @list = List.new
    end

    def create
      @list = List.new(list_params)
      if @list.save
        redirect_to @list, notice: "List was successfully created"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @list.update(list_params)
        redirect_to @list, notice: "list was succesfully updated"
      else
        render :edit
      end
    end

    def destroy
      @list.destroy
      redirect_to lists_url
    end

    private

    def list_params
      params.require(:list).permit(:name)
    end

    def set_list
      @list = List.find(params[:id])
    end
end
