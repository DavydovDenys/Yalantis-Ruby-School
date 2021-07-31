# frozen_string_literal: true

class CouriersController < ApplicationController
  before_action :set_courier, except: %i[create new index]

  def index
    @couriers = Courier.all.reverse
  end

  def new
    @courier = Courier.new
  end

  def show; end

  def create
    @courier = Courier.new(courier_params)

    if @courier.save
      redirect_to couriers_path, notice: 'Courier was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @courier.update(courier_params)
      redirect_to @courier, notice: 'Courier was successfully updated.'
    else
      render :edit, notice: @courier.errors.full_messages
    end
  end

  def destroy
    @courier.destroy

    redirect_to couriers_path, notice: 'Courier was deleted.'
  end
end

private

def courier_params
  params.require(:courier).permit(:name, :email)
end

def set_courier
  @courier = Courier.find(params[:id])
end
