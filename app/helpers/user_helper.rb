module UserHelper

  def params_update
    params.require(:user).permit(
        :full_name, :email, :phone_number, :gender, :date_of_birth, :is_locked,
        teacher_profile_attributes: [
            :bio, :education_level, :experience_years, :location, :hourly_rate,
            subjects: {},
            availability: {}
        ]
    )
  end
end
