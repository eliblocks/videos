class SectionsController < ApplicationController
  before_action :set_section, only: [:update, :destroy]
  before_action :set_section_and_position, only: [:show, :edit]
  before_action :set_show, only: [:new, :create]

  def index
  end

  def show
    @show = @section.show
    @videos = @section.videos
  end

  def new
    @section = @show.sections.new.add_position
  end

  def create
    @section = @show.sections.new(section_params)
    if @section.save
      flash[:success] = "Section added"
      redirect_to show_path(@show)
    else
      render 'edit'
    end
  end

  def edit
    @show = @section.show
  end

  def update
    if @section.update_attributes(section_params)
      flash[:success] = "Module updated"
      redirect_to show_path(@section.show)
    else
      render 'edit'
    end
  end

  def destroy
    @section.destroy
    flash[:success] = "Module deleted"
    redirect_to show_path(@section.show)
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

  def set_show
    @show = Show.find(params[:show_id])
  end




end
