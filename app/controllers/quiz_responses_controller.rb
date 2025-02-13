class QuizResponsesController < ApplicationController
  before_action :set_quiz_response, only: %i[ show edit update destroy ]

  # GET /quiz_responses or /quiz_responses.json
  def index
    @quiz_responses = QuizResponse.all
  end

  # GET /quiz_responses/1 or /quiz_responses/1.json
  def show
  end

  # GET /quiz_responses/new
  def new
    @quiz_response = QuizResponse.new
  end

  # GET /quiz_responses/1/edit
  def edit
  end

  # POST /quiz_responses or /quiz_responses.json
  def create
    @quiz_response = QuizResponse.new(quiz_response_params)

    respond_to do |format|
      if @quiz_response.save
        format.html { redirect_to @quiz_response, notice: "Quiz response was successfully created." }
        format.json { render :show, status: :created, location: @quiz_response }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_responses/1 or /quiz_responses/1.json
  def update
    respond_to do |format|
      if @quiz_response.update(quiz_response_params)
        format.html { redirect_to @quiz_response, notice: "Quiz response was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz_response }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_responses/1 or /quiz_responses/1.json
  def destroy
    @quiz_response.destroy!

    respond_to do |format|
      format.html { redirect_to quiz_responses_path, status: :see_other, notice: "Quiz response was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_response
      @quiz_response = QuizResponse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_response_params
      params.require(:quiz_response).permit(:quiz_id, :user_id, :selected_option_id)
    end
end
