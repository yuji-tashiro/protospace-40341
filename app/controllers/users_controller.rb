class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes # このユーザーが投稿したプロトタイプを取得
  end
end
