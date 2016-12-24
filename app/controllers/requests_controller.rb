class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /histories
  # GET /histories.json
  def index
    redirect_back(fallback_location: root_path) if current_user.nil? || current_user.email != 'admin'
    @requests = Request.all
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
  end

  # GET /histories/new
  def new
    @request = Request.new
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request.destroy if !@request.nil?
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:count, :request)
    end
end
