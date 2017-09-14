class Admin::SectionsController < Admin::AdminController
  def show
    @section = Section.find(params[:id])
  end
end
