class IndicatorsController < ApplicationController
  def index
    @indicators = Indicator.all

  end # show

  def show
    headers['Access-Control-Allow-Origin'] = '*'
    search_string = params[:label]

    @indicator_substring = Indicator.all.where("label Like '%#{search_string}%'")
    # raise 'shellfish'
     respond_to do |format|
       if @indicator_substring.present?
         format.html
         format.json {render :json => @indicator_substring}
      end # if
    end
  end

end # controller
