class QuizOptionsController < ApplicationController
  before_action :set_quiz_option, only: %i[ show edit update destroy ]

  # GET /quiz_options or /quiz_options.json
  def index
    @quiz_options = QuizOption.all
  end

  # GET /quiz_options/1 or /quiz_options/1.json
  def show
  end

  # GET /quiz_options/new
  def new
    @quiz_option = QuizOption.new
  end

  # GET /quiz_options/1/edit
  def edit
  end

  # POST /quiz_options or /quiz_options.json
  def create
    @quiz_option = QuizOption.new(quiz_option_params)

    respond_to do |format|
      if @quiz_option.save
        format.html { redirect_to @quiz_option, notice: "Quiz option was successfully created." }
        format.json { render :show, status: :created, location: @quiz_option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_options/1 or /quiz_options/1.json
  def update
    respond_to do |format|
      if @quiz_option.update(quiz_option_params)
        format.html { redirect_to @quiz_option, notice: "Quiz option was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz_option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_options/1 or /quiz_options/1.json
  def destroy
    @quiz_option.destroy!

    respond_to do |format|
      format.html { redirect_to quiz_options_path, status: :see_other, notice: "Quiz option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_option
      @quiz_option = QuizOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_option_params
      params.require(:quiz_option).permit(:quiz_id, :content, :correct)
    end
end
