class UsersController < ApplicationController

  def create
    begin
      validate_request_params
      college = College.find(params[:college_id])
      validate_college

      exam = college.exams.find(params[:exam_id])

      validate_exam
      validate_exam_window(exam)
      user = User.find_or_create_by(get_user_params(params))

      user.update(exam: exam)

      render json: { message: 'User successfully created and associated with the exam' }, status: :ok
    rescue StandardError => e
      render json: { error: e.message }, status: :bad_request
    end
  end

  private

  def validate_college
    @college = College.find(params[:college_id])
    raise 'College not found' unless @college
  end

  def validate_exam
    @exam = @college.exams.find(params[:exam_id])
    raise 'Exam not found or does not belong to the colleges' unless @exam
  end

  def validate_request_params
    raise 'Invalid request data' unless params[:first_name].present? && params[:last_name].present? && params[:phone_number].present? && params[:college_id].present? && params[:exam_id].present? && params[:start_time].present?
  end

  def validate_exam_window(exam)
    unless exam.exam_window.present? && exam.exam_window.start_time <= params[:start_time] && params[:start_time] <= exam.exam_window.end_time
      raise 'Invalid start time. It does not fall within the exam\'s time window.'
    end
  end




  def get_user_params(params)
    return {
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
    }
  end
end
