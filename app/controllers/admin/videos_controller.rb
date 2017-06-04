module Admin
  class VideosController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      @videos = Video.all
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Video.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def approve_selected
        @videos = Video.find(params[:selected])
    end
  end
end
