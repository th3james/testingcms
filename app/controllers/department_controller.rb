class DepartmentController < ApplicationController
  def index
		@departments = Department.all
  end

  def show
  end

  def new
  end

  def edit
  end

end
