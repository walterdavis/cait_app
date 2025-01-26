class ShapesController < ApplicationController
  def show
    @shape = Shape.find params[:id]
    render layout: false
  end
end
