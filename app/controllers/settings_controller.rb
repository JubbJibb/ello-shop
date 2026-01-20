
class SettingsController < ApplicationController
  def edit
    @setting = Setting.current
  end

  def update
    @setting = Setting.current
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
