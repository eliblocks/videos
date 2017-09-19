class Admin::CoursesController < Admin::AdminController

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def toggle_approval
    @course = Course.find(params[:id])
    puts @course.approved
    if @course.approved
      @course.update(approved: false)
    else
      @course.update(approved: true)
    end
    redirect_to admin_courses_path
  end

end
