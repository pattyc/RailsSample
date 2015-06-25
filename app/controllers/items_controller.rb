class ItemsController < ApplicationController

  def create
    @supplier = Supplier.find(params[:supplier_id])
    @item = @supplier.items.create(item_params)
    redirect_to(supplier_path(@supplier))
  end

  def destroy
    @supplier = Supplier.find(params[:supplier_id])
    @item = @supplier.items.find(params[:id])
    @item.destroy
    redirect_to(@supplier)
  end

  private
    def item_params
      params.require(:item).permit(:name, :description)
    end
end
