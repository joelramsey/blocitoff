class ItemsController < ApplicationController
  
  def index
    @items = current_user.items
    authorize @items
  end
  
  def show
    @user = current_user
    @item = Item.find(params[:id])
    authorize @item
  end
  
  def new
    @user = current_user
    @item = Item.new
    authorize @item
  end
  
  def create
    @user = current_user
    @item = current_user.items.build(item_params)
    authorize @item
    if @item.save(item_params)
      flash[:notice] = "Item was successfully created."
      redirect_to @item
      
    else
      flash[:alert] = "Error creating item."
      redirect_to @item
    end
  end
  
  def edit
    @user = current_user
    @item = Item.find(params[:id])
    authorize @item
  end
  
  def update
    @user = current_user
    @item = Item.new(item_params)
    authorize @item
    if @item.update_attributes(item_params)
      flash[:notice] = "Item was successfully updated."
      redirect_to @item
      
    else
      flash[:alert] = "Error updating item."
      redirect_to @item
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @items = current_user.items
    name = @item.name
    authorize @item
    
    if @item.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to @item
     else
      flash[:error] = "There was an error deleting the item."
      render @item
     end
   end
  
  
  private
 
  def item_params
    params.require(:item).permit(:name, :details)
   end
end
