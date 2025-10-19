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

  def tinh_cap_hoc(date)
    tuoi = Time.now.year - date.year
    case tuoi
    when 0..11
      'Cấp 1'
    when 12..15
      'Cấp 2'
    else
      'Cấp 3'
    end
  end
end
