class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all
  end

  def show
  end

  def new
    @pin = current_user.pins.build
    
  end

  def edit
  end

  def create
    @pin = Pin.new(pin_params)
      if @pin.save
        redirect_to @pin, notice: "You Pitched a Post"
        
      else
        render action: 'new'
      end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Update Post'
    else
      render action: 'fix?'
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description)
    end
end
