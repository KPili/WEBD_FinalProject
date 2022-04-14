class EmployeesController < ApplicationController
  def index
    @employees = Employee.includes(:job).all
  end

  def show
    @employee = Employee.find(params[:id])
    @job = Job.find(params[:id])
  end
end
