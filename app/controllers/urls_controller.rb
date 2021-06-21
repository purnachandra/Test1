class UrlsController < ApplicationController
  def index

  end

  def show
    @url = Url.find(params[:id])
    url_extension = @url.original_url
    @original_url = "#{url_extension}"
    short_url = @url.short_url
    @short_url = "http://short.com/#{short_url}"
    @rh = request.headers['HTTP_USER_AGENT']
    @ra = request.ip
  end

  def create
    @url = Url.new(link_params)
    @url.short_url = @url.generate_short_url
    @url.original_url = @url.sanitize
    if @url.save
      redirect_to @url
    else
      redirect_to 'url/index'
    end
  end


  private

  def link_params
    params.require(:url).permit(:original_url)
  end

end
