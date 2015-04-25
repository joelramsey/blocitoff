class ItemsController < ApplicationController
  
  def index
    @items = current_user.items
    authorize @items
  end
  
  #def show  
   # @user = current_user
  # @item = Item.find(params[:id])
   # authorize @item
  #end
  
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
      redirect_to action: 'index'
      
    else
      flash[:alert] = "Error creating item."
      redirect_to action: 'index'
    end
  end
  
  def edit
    
    @user = current_user
    @item = Item.find(params[:id])
    authorize @item
  end
  
  def update
 
    @user = current_user
    @item = Item.find(params[:id])
    authorize @item
    
    if @item.update_attributes(item_params)
      flash[:notice] = "Item was successfully updated."
      redirect_to action: 'index'
      
    else
      flash[:alert] = "Error updating item."
      redirect_to action: 'index'
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    authorize @item
    
    if @item.destroy
      flash[:notice] = "Task complete!"
      
    else
      flash[:error] = "There was an error deleting the task. Please try again."
     
    end
    respond_to do |format|
       format.html
       format.js
     end
   end
  
  
  private
 
  def item_params
    params.require(:item).permit(:name, :details)
  end
end
