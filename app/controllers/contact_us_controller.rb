class ContactUsController < ApplicationController

  def new
    Rails.logger.info ">>>>>>>>>>>>>>"
    render :new, layout: "special"
  end

  def create
    @name = params[:full_name]

  end

end
