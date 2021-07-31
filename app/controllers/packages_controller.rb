# frozen_string_literal: true

class PackagesController < ApplicationController
  def create
    courier = Courier.find(params[:courier_id])
    @package = courier.packages.new(package_params)
    if @package.save
      redirect_to courier_path(courier), notice: 'Package was successfully created'
    else
      redirect_to courier_path(courier), notice: @package.errors.full_messages.first
    end
  end

  private

  def package_params
    params.require(:package).permit(:tracking_number, :delivery_status)
  end
end
