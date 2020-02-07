class IndicatorsController < ApplicationController
  before_action :allow_cross_origin



  def index
    @indicators = Indicator.all

    respond_to do |format|
      if @indicators.present?
        format.html #
        format.json {render :json => @indicators}
      else
        format.html
        format.json {render json:indicators.errors}
      end
    end

  end

  def show

    search_string = params[:label]
    @indicator_substrings = Indicator.all.where("LOWER(label) Like LOWER('%#{search_string}%')")

    respond_to do |format|
      if @indicator_substrings.present?
        format.html #
        format.json {render :json => @indicator_substrings}
      else
        format.html
        format.json {render json:indicator_substrings.errors}
      end
    end

  end

  private
  def allow_cross_origin
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
