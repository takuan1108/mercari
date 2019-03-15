class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from :facebook
  end

  private
  def callback_from(provider)
    provider = provider.to_s
    @user = User.find_for_oauth_about_user(request.env['omniauth.auth'])
    @user.social_profiles.new(uid: request.env['omniauth.auth'].uid, provider: request.env['omniauth.auth'].provider)
    if @user.persisted?  # ユーザーがデータベース上に存在している。
      sign_in_and_redirect root_path, event: :authentication  # ユーザーをsign_inする
      set_flash_message(:notice, :success, kind: __callee__.to_s.capitalize) if is_navigational_format?
    else  # 何らかの理由でデータベースに保存されていない。
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      render 'users/registrations/new'
    end
  end
end
