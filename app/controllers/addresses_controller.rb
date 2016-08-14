class AddressesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @addresses = Address.order(sort_column + " " + sort_direction)
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      redirect_to @address
    else
      render 'new'
    end
  end

  def update
    @address = Address.find(params[:id])

    if @address.update(address_params)
      redirect_to @address
    else
      render 'edit'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    redirect_to addresses_path
  end

  private

    def sortable_columns
      ["number", "street", "city", "state"]
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "number"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def address_params
      params.require(:address).permit(:number, :street, :city, :state)
    end
end
