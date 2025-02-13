module Admin
class ShapesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_shape, only: %i[ show edit update destroy sort ]

  # GET /shapes or /shapes.json
  def index
    @shapes = Shape.order(:position)
  end

  # GET /shapes/1 or /shapes/1.json
  def show
  end

  # GET /shapes/new
  def new
    @shape = Shape.new
  end

  # GET /shapes/1/edit
  def edit
  end

  # POST /shapes or /shapes.json
  def create
    @shape = Shape.new(shape_params)

    respond_to do |format|
      if @shape.save
        format.html { redirect_to admin_shapes_path }
        format.json { render :show, status: :created, location: @shape }
        format.turbo_stream { }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shapes/1 or /shapes/1.json
  def update
    respond_to do |format|
      if @shape.update(shape_params)
        format.html { redirect_to admin_shape_path(@shape) }
        format.json { render :show, status: :ok, location: @shape }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shape.errors, status: :unprocessable_entity }
      end
    end
  end

  def sort
    @shape.insert_at(params.expect(:position).to_i)
    head :no_content
  end

  # DELETE /shapes/1 or /shapes/1.json
  def destroy
    @shape.destroy!

    respond_to do |format|
      format.html { redirect_to admin_shapes_path, status: :see_other }
      format.json { head :no_content }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(helpers.dom_id(@shape, 'list-item')) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shape
      @shape = Shape.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def shape_params
      params.expect(shape: [ :name, :position, :customize, :price ])
    end
end
end
