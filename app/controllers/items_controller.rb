class ItemsController < ApplicationController
  before_filter :check_user

  def check_user
    unless current_user
      redirect_to login_path
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(:name => params[:item][:name],
                     :description => params[:item][:description],
                     :is_lost => params[:item][:is_lost],
                     :user => current_user)

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_url
  end
end
