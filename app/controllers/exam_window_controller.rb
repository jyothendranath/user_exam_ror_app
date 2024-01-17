class ExamWindowsController < ApplicationController
  before_action :set_exam_window, only: [:show, :update, :destroy]

  def create
    @exam_window = ExamWindow.new(exam_window_params)

    if @exam_window.save
      render json: @exam_window, status: :created
    else
      render json: @exam_window.errors
    end
  end

  def show
    render json: @exam_window
  end

  def update
    if @exam_window.update(exam_window_params)
      render json: @exam_window, status: :ok
    else
      render json: @exam_window.errors
    end
  end

  def destroy
    @exam_window.destroy
  end

  private

  def set_exam_window
    @exam_window = ExamWindow.find(params[:id])
  end

  def exam_window_params
    params.require(:exam_window).permit(:start_time, :end_time, :exam_id)
  end
end
