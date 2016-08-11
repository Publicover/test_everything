class AddressesController < ApplicationController

  def index
    @addresses = Address.all
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

    if @address.save
      redirect_to @address
    else
      render 'edit'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    redirect_to address_index_path
  end

  private

    def address_params
      params.require(:address).permit(:number, :street, :city, :state)
    end
end