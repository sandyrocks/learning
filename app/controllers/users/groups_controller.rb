class Users::GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to users_groups_path(@group), notice: 'Group Created Successfully'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to user_group_path(@group)
    else
      render 'edit'
    end
  end

  def destroy
    @group.destroy
    redirect_to users_groups_path
  end

  private
    def set_group
      @group = Group.find params[:id]
    end

    def group_params
      params.require(:group).permit(:name)
    end
end