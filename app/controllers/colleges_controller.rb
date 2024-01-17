class CollegesController < ApplicationController
  before_action :set_college, only: [:show, :update, :destroy]

  def create
    @college = College.new(college_params)

    if @college.save
      render json: @college, status: :created
    else
      render json: @college.errors
    end
  end

  def show
    render json: @college
  end

  def update
    if @college.update(college_params)
      render json: @college, status: :ok
    else
      render json: @college.errors
    end
  end

  def destroy
    @college.destroy
    head :no_content
  end

  private

  def set_college
    @college = College.find(params[:id])
  end

  def college_params
    params.require(:college).permit(:college_name)
  end
end

