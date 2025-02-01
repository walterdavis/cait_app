module Admin
class ColorsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_color, only: %i[ show edit update destroy sort ]

  # GET /colors or /colors.json
  def index
    @colors = Color.order(:position)
  end

  # GET /colors/1 or /colors/1.json
  def show
  end

  # GET /colors/new
  def new
    @color = Color.new
  end

  # GET /colors/1/edit
  def edit
  end

  # POST /colors or /colors.json
  def create
    @color = Color.new(color_params)

    respond_to do |format|
      if @color.save
        format.html { redirect_to admin_color_path(@color), notice: "Color was successfully created." }
        format.json { render :show, status: :created, location: admin_color_path(@color) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colors/1 or /colors/1.json
  def update
    respond_to do |format|
      if @color.update(color_params)
        format.html { redirect_to admin_color_path(@color), notice: "Color was successfully updated." }
        format.json { render :show, status: :ok, location: admin_color_path(@color) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  def sort
    @color.insert_at(params.expect(:position).to_i)
    head :no_content
  end

  # DELETE /colors/1 or /colors/1.json
  def destroy
    @color.destroy!

    respond_to do |format|
      format.html { redirect_to admin_colors_path, status: :see_other, notice: "Color was successfully removed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color
      @color = Color.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def color_params
      params.expect(color: [ :name, :position ])
    end
end
end
