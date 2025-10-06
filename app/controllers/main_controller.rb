class MainController < ApplicationController

  # GET /index
  def index
    @user = User.all

    if params[:query].present?
      q = "%#{params[:query]}%"
      @user = @user.where("full_name LIKE ? OR email LIKE ?", q, q)
    end

    if params[:role].present?
      @user = @user.where(role: params[:role])
    end

    @user = @user.paginate(page: params[:page], per_page: 3)
  end

end


