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
    @section = Section.find(params[:section_id])
    @video = @section.videos.new(video_params)
    media = Wistia::Media.find(@video.wistia_id)
    @video.wistia_delivery_id = media.thumbnail.url[40, 40]
    @video.length_in_seconds = media.duration
    @video.user = @section.course.user

    if @video.save
      flash[:success] = "video saved"
    end

    redirect_back fallback_location: root_path

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

  private

  def video_params
    params.require(:video).permit(:title, :wistia_id)
  end

end
