module Users
  class SessionsController < Devise::SessionsController
    def guest_sign_in
      guest_user = User.guest
      Status.find_or_create_by!(user_id: guest_user.id)
      sign_in guest_user
      redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
    end
  end
end
