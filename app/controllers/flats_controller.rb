require "open-uri"

class FlatsController < ApplicationController
  before_action :find_flats, only: [:index, :show]

  def index
  end

  def show
    # 1. retrieve the id of the flat to display
    flat_id = params[:id]

    # 2. find the flat within @flats
    @flat = @flats.select { |flat| flat['id'] == flat_id.to_i }.first
  end

  private

  def find_flats
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    @flats = JSON.parse(open(url).read)
  end
end
