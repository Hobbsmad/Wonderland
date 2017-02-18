class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    # step 1: load the place for the corresponding
    #         photo from the database
    place = Place.find(params[:place_id])

    # step 2: create the photo attached to
    #         the place we've found
    @photo = place.photos.create(photo_params)

    # step 3: return the user to the place detail
    #        page
    redirect_to place_path(place)
  end

  private
    def photo_params
      params.require(:photo).permit(:caption, :place_id, :picture)
    end
end
