class SectionsController < ApplicationController

  def index
  end

  def show
    @section = Section.find(params[:id]).add_position
    @show = @section.show
    @videos = @section.videos
  end

  def new
    @show = Show.find(params[:show_id])
    @section = @show.sections.new.add_position
  end

  def create
    @show = Show.find(params[:show_id])
    @section = @show.sections.new(section_params)
    if @section.save
      flash[:success] = "Section added"
      redirect_to show_path(@show)
    else
      render 'edit'
    end
  end

  def edit
    @section = Section.find(params[:id]).add_position
    @show = @section.show
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:success] = "Module updated"
      redirect_to show_path(@section.show)
    else
      render 'edit'
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:success] = "Module deleted"
    redirect_to show_path(@section.show)
  end

  def section_params
    params.require(:section).permit(:title)
  end


end
