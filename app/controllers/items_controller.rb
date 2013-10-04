class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  	  redirect_to @item, notice: "Successfully created item!"
  	else
  	  render :new
  	end
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	@item = Item.find(params[:id])
	  if @item.update_attributes(item_params)
	    redirect_to @item, notice: "Updated Item!"
	  else
	    render :edit
	  end
	end

  def show
  	@item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_url, notice: "Destroyed Item"
  end

  private

    def item_params
      params.require(:item).permit(:name, :reserved_price, :user_id, :auction_id, :sold_price, :sold )
    end
end
