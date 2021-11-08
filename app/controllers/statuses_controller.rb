class StatusesController < ApplicationController
  before_action :set_status, only: %i[edit update]

  def new
    @status = Status.new
  end

  def create
    current_user.create_status!(status_params)
    redirect_to mypage_path(current_user)
  end

  def edit
    @status = Status.find_by(user_id: params[:id])
  end

  def update
    @status.update!(status_params)
    redirect_to mypage_path(current_user)
  end

  private

  def set_status
    @status = current_user.status
  end

  def status_params
    params.require(:status).permit(
      :sex, :age, :height, :weight, :body_type,
      :meal, :movement, :sleep, :environment,
      :annual_income, :happiness, :human_relationship, :user_id
    )
  end
end
