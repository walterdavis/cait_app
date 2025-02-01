class ShapesController < ApplicationController
  def show
    @shape = Shape.find params[:id]
    render plain: "custom" if @shape.customize?
  end
end
