class StatusesController < ApplicationController
  before_action :set_status, only: %i[edit update]

  def new
    @status = Status.new
  end

  def create
    if current_user.create_status!(status_params)
      redirect_to mypage_path(current_user), notice: "作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end

  def edit
    @status = Status.find_by(user_id: params[:id])
  end

  def update
    if @status.update!(status_params)
      redirect_to mypage_path(current_user), notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
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
