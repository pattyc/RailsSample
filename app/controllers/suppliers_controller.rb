class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
  end

  def create
    @supplier = Supplier.new(supplier_params)

    @supplier.save
    redirect_to @supplier
  end

  def destroy
    @supplier = Supplier.find(params[:id])

    @supplier.destroy
    redirect_to suppliers_path
  end

  def import
    @supplier = Supplier.find(params[:id])
    @items = Item.import(params[:file], params[:id])
    redirect_to @supplier, notice: "Items Imported"
  end

  private
    def supplier_params
      params.require(:supplier).permit(:name)
    end
end
