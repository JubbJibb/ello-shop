
class SettingsController < ApplicationController
  before_action :set_setting

  def edit
  end

  def update
    if @setting.update(setting_params)
      redirect_to orders_path, notice: "Updated price successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_setting
    @setting = Setting.current
  end

  def setting_params
    params.require(:setting).permit(:price_per_bag)
  end
end
