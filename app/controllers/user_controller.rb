class UserController < ApplicationController

  skip_before_action :authorization, only: [:new, :create]
  # GET /index
  def new
  end

  def create
    if params[:new_email].blank? || params[:new_password].blank? || params[:re_password].blank? || params[:role].blank?
      flash.now[:alert] = "Vui lòng nhập đầy đủ thông tin!"
      render :new, status: :unprocessable_entity
    elsif User.find_by(email: params[:new_email]).present?
      flash[:notice] = "Email đã tồn tại!"
      render :new, status: :unprocessable_entity
    elsif params[:new_password] != params[:re_password]
      flash.now[:alert] = "Nhập mật khẩu không trùng lặp!"
      render :new, status: :unprocessable_entity
    else
      flash[:notice] = "Đăng kí thành công!"
      User.create!(full_name: '..chưa có tên..', email: params[:new_email], password: params[:new_password], role: params[:role])
      redirect_to register_path
    end
  end

end



