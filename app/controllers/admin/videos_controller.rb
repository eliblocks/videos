class Admin::VideosController < Admin::AdminController
  def index
    @videos = Video.all.order(:id)
  end

  def new
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end

  def toggle_approval
    @video = Video.find(params[:id])
    if @video.approved
      @video.update(approved: false)
    else
      @video.update(approved: true)
    end
    redirect_to admin_videos_path
  end

end
