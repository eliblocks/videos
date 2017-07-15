class ShowsController < ApplicationController

  def index
    @shows = Show.all
  end

  def show
    @show = Show.find(params[:id])
    @sections = @show.sections.add_positions
  end

  def new
    @show = current_user.shows.new
  end

  def create
    @show = current_user.shows.new(show_params)
    if @show.save
      flash[:success] = "Course created"
      redirect_to show_path(@show)
    else
      render 'new'
    end
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    if @show.update_attributes(show_params)
      flash[:success] = "Show updated"
      redirect_to show_path(@show)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def show_params
    params.require(:show).permit(:title, :description)
  end


end
