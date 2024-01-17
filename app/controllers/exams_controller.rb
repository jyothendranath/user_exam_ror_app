class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :update, :destroy]

  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      render json: @exam, status: :created
    else
      render json: @exam.errors
    end
  end

  def show
    render json: @exam
  end

  def update
    if @exam.update(exam_params)
      render json: @exam, status: :ok
    else
      render json: @exam.errors
    end
  end

  def destroy
    @exam.destroy
    head :no_content
  end

  private

  def set_exam
    @exam = Exam.find(params[:id])
  end

  def exam_params
    params.require(:exam).permit(:exam_name, :college_id)
  end
end
