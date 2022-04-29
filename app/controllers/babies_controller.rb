class BabiesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @baby = Baby.all
  end

  def new
    @baby = Baby.new
  end

  def create
    @baby = Baby.create(baby_params)
    Hospital.create(hospital_params)
    if @baby.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @baby = Baby.find(params[:id])
    @babybirth = @baby.birthday
    @hospital = Hospital.where(baby_id: @baby).first
  end

  def edit
    @baby = Baby.find(params[:id])
    @hospital = Hospital.where(baby_id: @baby).first
  end

  def update
    @baby = Baby.find(params[:id])
    @hospital = Hospital.where(baby_id: @baby).first
    if @baby.update(baby_params) && @hospital.update(hospital_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    baby = Baby.find(params[:id])
    if user_signed_in? && current_user.id == baby.user_id
      baby.destroy
      redirect_to root_path
    end
  end

  private

  def baby_params
    params.permit(:name, :gender_id, :birthday, :image).merge(user_id: current_user.id)
  end

  def hospital_params
    params.permit(:hospitalname, :week, :phone, :mapurl).merge(baby_id: @baby.id)
  end
end
