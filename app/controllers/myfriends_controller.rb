# frozen_string_literal: true

class MyfriendsController < ApplicationController
  before_action :set_myfriend, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /myfriends or /myfriends.json
  def index
    @myfriends = Myfriend.all
  end

  # GET /myfriends/1 or /myfriends/1.json
  def show; end

  # GET /myfriends/new
  def new
    @myfriend = Myfriend.new
  end

  # GET /myfriends/1/edit
  def edit; end

  # POST /myfriends or /myfriends.json
  def create
    @myfriend = Myfriend.new(myfriend_params)

    respond_to do |format|
      if @myfriend.save
        format.html do
          redirect_to myfriend_url(@myfriend), notice: 'A new friend was successfully created.'
        end
        format.json { render :show, status: :created, location: @myfriend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @myfriend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /myfriends/1 or /myfriends/1.json
  def update
    respond_to do |format|
      if @myfriend.update(myfriend_params)
        format.html do
          redirect_to myfriend_url(@myfriend), notice: 'Your friend was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @myfriend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @myfriend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /myfriends/1 or /myfriends/1.json
  def destroy
    @myfriend.destroy

    respond_to do |format|
      format.html { redirect_to myfriends_url, notice: 'You friend was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_myfriend
    @myfriend = Myfriend.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def myfriend_params
    params.require(:myfriend).permit(:user_name, :first_name, :email, :user_id)
  end
end
