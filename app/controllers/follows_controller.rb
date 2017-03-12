class FollowsController < ApplicationController

  before_action :set_room

  def create
    current_user.follow!(@room)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    current_user.unfollow!(@room)
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

end
