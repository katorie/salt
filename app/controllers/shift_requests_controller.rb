class ShiftRequestsController < ApplicationController
  before_action :set_shift_request, only: [:show, :edit, :update, :destroy]

  # GET /shift_requests
  # GET /shift_requests.json
  def index
    @shift_requests = ShiftRequest.all.includes(:member)
  end

  # GET /shift_requests/1
  # GET /shift_requests/1.json
  def show
  end

  # GET /shift_requests/new
  def new
    @member = Member.find(params[:member_id])
    @shift_request = ShiftRequest.new
    today = Date.today
    @request_month = today.next_month
    @request_days = @request_month.all_month
    @request_days.count.times { @member.shift_requests.build }
  end

  # GET /shift_requests/1/edit
  def edit
  end

  # POST /shift_requests
  # POST /shift_requests.json
  def create
    @shift_request = ShiftRequest.new

    respond_to do |format|
      if @shift_request.save
        format.html { redirect_to @shift_request, notice: 'Shift request was successfully created.' }
        format.json { render :show, status: :created, location: @shift_request }
      else
        format.html { render :new }
        format.json { render json: @shift_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shift_requests/1
  # PATCH/PUT /shift_requests/1.json
  def update
    respond_to do |format|
      if @shift_request.update(shift_request_params)
        format.html { redirect_to @shift_request, notice: 'Shift request was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift_request }
      else
        format.html { render :edit }
        format.json { render json: @shift_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shift_requests/1
  # DELETE /shift_requests/1.json
  def destroy
    @shift_request.destroy
    respond_to do |format|
      format.html { redirect_to shift_requests_url, notice: 'Shift request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift_request
      @shift_request = ShiftRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_request_params
      params.require(:shift_request).permit(:slot, :date, :member_id, :comment)
    end
end
