class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]

  def index
    @shows = Show.all.page(params[:page]).per(5)
  end

  def show
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

  end

  def update
    if @show.update_attributes(show_params)
      flash[:success] = "Show updated"
      redirect_to show_path(@show)
    else
      render 'edit'
    end
  end

  def destroy
    @show.destroy
    flash[:success] = "Course deleted"
    redirect_to shows_path
  end

  private

  def show_params
    params.require(:show).permit(:title, :description)
  end

  def set_show
    @show = Show.find(params[:id])
  end


end
