class SectionsController < ApplicationController
  before_action :set_section, only: [:update, :destroy]
  before_action :set_section_and_position, only: [:show, :edit]
  before_action :set_course, only: [:new, :create]

  def index
  end

  def show
    @course = @section.course
    @videos = @section.videos
  end

  def new
    @section = @course.sections.new.add_position
  end

  def create
    @section = @course.sections.new(section_params)
    if @section.save
      flash[:success] = "Section added"
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  def edit
    @course = @section.course
  end

  def update
    if @section.update_attributes(section_params)
      flash[:success] = "Module updated"
      redirect_to course_path(@section.course)
    else
      render 'edit'
    end
  end

  def destroy
    @section.destroy
    flash[:success] = "Module deleted"
    redirect_to course_path(@section.course)
  end

  private

  def section_params
    params.require(:section).permit(:title)
  end

  def set_section
    @section = Section.find(params[:id])
  end

  def set_section_and_position
    @section = Section.find(params[:id]).add_position
  end

  def set_course
    @course = Course.find(params[:course_id])
  end




end
