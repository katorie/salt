class MembersController < ApplicationController
  before_action :set_member, only: [:edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all

    if session[:login]
      @member = Member.find_by(code: session[:login])
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    if session[:login]
      @member = Member.find_by(code: session[:login])
      @shift_requests = @member.shift_requests
    else
      redirect_to new_session_path
    end
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Member.import(params[:file])
    redirect_to members_path, notice: 'アップロードしました。'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :code, shift_requests_attributes: [:id, :date, :slot, :comment, :member_id, :start_time, :end_time])
    end
end
