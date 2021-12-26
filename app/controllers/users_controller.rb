class UsersController < ApplicationController
  def show
    # @userは、レコードを探す
    @user = User.find(params[:id])
    # @prototypesは、@userが投稿した一覧をrenderで作成する。
    @prototypes = @user.prototypes
  end

  private
  def user_params
    params.require(:users).permit(:name, :profile, :occupation, :position).merge(user_id: current_user.id)
  end
end
