class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all.page(params[:page]).per(5)
  end

  def show
    @sections = @course.sections
    if @sections.count == 1
      redirect_to section_path(@sections.first)
    end
  end

  def new
    @course = current_user.courses.new
  end

  def create
    @course = current_user.courses.new(course_params)
    if @course.save
      flash[:success] = "Course created"
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @course.update_attributes(course_params)
      flash[:success] = "course updated"
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy
    flash[:success] = "Course deleted"
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:title, :description)
  end

  def set_course
    @course = Course.find(params[:id])
  end


end
