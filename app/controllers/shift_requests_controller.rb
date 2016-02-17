class ShiftRequestsController < ApplicationController
  before_action :set_shift_request, only: [:show, :update, :destroy]
  protect_from_forgery except: [:destroy]

  # GET /shift_requests
  # GET /shift_requests.json
  def index
    @shift_requests = ShiftRequest.all.includes(:member)

    respond_to do |format|
      format.html
      format.csv { send_data @shift_requests.to_csv, type: 'text/csv; charset=shift_jis' }
      format.xls { send_data @shift_requests.to_csv(col_sep: "\t"), type: 'text/csv; charset=shift_jis' }
    end
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
    # Where should we write this array?
    @time_select = %w(1000 1030 1100 1130 1200 1230 1300 1330 1400 1430 1500 1530 1600 1630 1700 1730 1800 1830 1900 1930 2000 2030 2100 2130 2200 2230 2300 2330 0000 0030 0100 0130 0200 0230 0300 0330 0400 0430 0500 0530 0600 0630 0700 0730 0800 0830 0900 0930)
    @national_holidays = HolidayJp.between(@request_days.to_a[0], @request_days.to_a[-1])
  end

  # GET /shift_requests/1/edit
  def edit
    # TODO: params[:id] から年・月をセット
    @member = Member.find(params[:member_id])
    year = params[:id][0..3]
    month = params[:id][4..5]
    @form = ShiftRequestsForm.new(year: year, month: month, member: @member)
    @request_month = Date.new(year.to_i, month.to_i)
    @request_days = @request_month.all_month
    @request_days.count.times { @member.shift_requests.build }
    # Where should we write this array?
    @time_select = %w(1000 1030 1100 1130 1200 1230 1300 1330 1400 1430 1500 1530 1600 1630 1700 1730 1800 1830 1900 1930 2000 2030 2100 2130 2200 2230 2300 2330 0000 0030 0100 0130 0200 0230 0300 0330 0400 0430 0500 0530 0600 0630 0700 0730 0800 0830 0900 0930)
    @national_holidays = HolidayJp.between(@request_days.to_a[0], @request_days.to_a[-1])
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
    @form = ShiftRequestsForm.new(shift_requests_params)
    if @form.save
      redirect_to root_path
    else
      render 'edit'
    end

    respond_to do |format|
      if @shift_request.update(shift_request_params)
        format.html { redirect_to member_path(@shift_request.member_id), notice: 'シフトを更新しました。' }
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
      format.html { redirect_to member_url(@shift_request.member_id), notice: '削除されました。'}
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
      params.require(:shift_request).permit(:slot, :date, :member_id, :comment, :start_time, :end_time)
    end
end
