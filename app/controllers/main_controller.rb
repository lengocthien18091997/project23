class MainController < ApplicationController

  # GET /index
  def index
    @user = User.all.order(:id)
    @current_user.reload
    if @current_user.role == 'student'
      @user = @user.where(role: 'teacher')
    end
    search_user
    @user = @user.paginate(page: params[:page], per_page: 3)

    @request = Request.joins("JOIN users ON users.id = requests.student_id")
                   .where(teacher_id: @current_user.id)
                   .select("requests.*, users.full_name AS full_name")
    @request = @request.paginate(page: params[:page], per_page: 3)
  end

  def search_user
    if params[:commit].nil?
      if @current_user.role == 'student'
        cap_hoc = tinh_cap_hoc(@current_user.date_of_birth)
        @user = @user.left_joins(:teacher_profile)
                    .where("teacher_profiles.subjects::text ILIKE ?", "%#{cap_hoc}%")
      else
        @user = @user.left_joins(:teacher_profile)
      end
      return
    end
    if params[:query].present?
      q = "%#{params[:query]}%"
      @user = @user.where("full_name LIKE ? OR email LIKE ?", q, q)
    end
    if params[:location].present?
      q = "%#{params[:location]}%"
      @user = @user.joins(:teacher_profile)
                  .where("teacher_profiles.location::text ILIKE ?", "%#{q}%")
    end
    if params[:mon_hoc].present? && params[:cap_hoc].present?
      @user = @user.joins(:teacher_profile)
                  .where("teacher_profiles.subjects ->> :key = :value",
                         key: params[:mon_hoc],
                         value: params[:cap_hoc])
    elsif params[:mon_hoc].present?
      @user = @user.joins(:teacher_profile)
                  .where("teacher_profiles.subjects ? :key", key: params[:mon_hoc])
    elsif params[:cap_hoc].present?
      @user = @user.joins(:teacher_profile)
                  .where("teacher_profiles.subjects::text ILIKE ?", "%#{params[:cap_hoc]}%")
    end
    if params[:role].present?
      @user = @user.where(role: params[:role])
    end
  end
end


