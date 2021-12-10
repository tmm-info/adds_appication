class AddsController < ApplicationController
  before_action :authenticate_user!, except: :index
  load_and_authorize_resource except: :index

  # before_action :set_add, only: %i[ show edit update destroy ]

  # GET /adds or /adds.json
  def index
    @adds = Add.all
    @users = User.all
    if params[:search]
    search_term = params[:search].downcase.gsub(/\s+/, "")
    @adds = Add.all.select{ |add|
      add.title.downcase.include?(search_term) ||
        add.body.downcase.include?(search_term) }
    else
      @adds
    end

end

  # GET /adds/1 or /adds/1.json
  def show; end

  # GET /adds/new
  def new
    # @add = Add.new
  end

  # GET /adds/1/edit
  def edit; end

  # POST /adds or /adds.json
  def create
    # @add = Add.new(add_params)
    @add.user_id = current_user.id
    respond_to do |format|
      if @add.save
        format.html { redirect_to @add, notice: 'Add was successfully created.' }
        format.json { render :show, status: :created, location: @add }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @add.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adds/1 or /adds/1.json
  def update
    respond_to do |format|
      if @add.update(add_params)
        format.html { redirect_to @add, notice: 'Add was successfully updated.' }
        format.json { render :show, status: :ok, location: @add }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @add.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adds/1 or /adds/1.json
  def destroy
    @add.destroy
    respond_to do |format|
      format.html { redirect_to adds_url, notice: 'Add was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # def set_add
    #   @add = Add.find(params[:id])
    # end

  def add_params
    params.require(:add).permit(:title, :body, :img, :user_id)
  end
end
