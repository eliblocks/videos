ActiveAdmin.register Video do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :approved,
                :title,
                :description,
                :user_id,
                :length_in_seconds,
                :created_at,
                :updated_at,
                :wistia_id,
                :wistia_delivery_id,
                :seconds_viewed,
                :price_step

  filter :user
  filter :title
  filter :approved
  filter :length_in_seconds
  filter :seconds_viewed
  filter :created_at
  filter :updated_at


  index do
    selectable_column
    column :user
    column :title
    column :description
    column "Length", :length_in_seconds
    column "Viewed", :seconds_viewed
    column :approved
    column :created_at
    column :updated_at
    actions
  end

  ActiveAdmin.register Video do
    batch_action :approve do |ids|
      batch_action_collection.find(ids).each do |video|
        video.approve
      end
    redirect_to collection_path, alert: "The videos have been approved."
    end
  end


  ActiveAdmin.register Video do
    batch_action :unapprove do |ids|
      batch_action_collection.find(ids).each do |video|
        video.unapprove
      end
    redirect_to collection_path, alert: "The videos have been unapproved."
    end
  end


  # action_item :approve, only: :show do
  #   link_to 'View on site', video_path(video)
  # end

  # member_action :approve, method: :put do
  #   video = Video.find(params[:id])
  #   video.update(approved: true)
  #   redirect_to admin_video_path(video)
  # end

  # member_action :unapprove, method: :put do
  #   video = Video.find(params[:id])
  #   video.update(approved: false)
  #   redirect_to admin_video_path(video)
  # end
end
