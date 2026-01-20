
class SettingsController < ApplicationController
  def edit
    @setting = Setting.first
  end

  def update
    @setting = Setting.first
    if @setting.update(setting_params)
      redirect_to orders_path, notice: "Updated price successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:price_per_bag)
  end
end
