class BabiesController < ApplicationController
  def index
    @baby = Baby.all
  end

  def new
    @baby = Baby.new
  end

  def create
    @baby = Baby.create(baby_params)
    if @baby.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @baby = Baby.find(params[:id])
    @babybirth = @baby.birthday
  end

  def edit
    @baby = Baby.find(params[:id])
  end

  def update
    @baby = Baby.find(params[:id])
    if @baby.update(baby_params)
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
    params.require(:baby).permit(:name, :gender_id, :birthday, :image).merge(user_id: current_user.id)
  end
end
