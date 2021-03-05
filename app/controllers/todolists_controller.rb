class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
    # @listではなく@listsにする。@listsの中には投稿データが全て入るため
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    #データを更新
    redirect_to todolist_path(list.id)
  end

  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
