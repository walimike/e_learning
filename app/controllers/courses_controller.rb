class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :authorize_admin!, only: [:new, :create, :edit, :update, :destroy]

  # GET /courses or /courses.json
  def index
    @courses = Course.left_joins(:bookmarked_users)  # Use the correct association name
                 .group(:id)
                 .order("COUNT(users.id) DESC")  # Order courses by bookmark count


    case params[:sort]
    when "created_at_desc"
      @courses = @courses.order(created_at: :desc)
    when "price_asc"
      @courses = @courses.order(price: :asc)
    when "price_desc"
      @courses = @courses.order(price: :desc)
    end
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = current_user.courses.build(course_params)


    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def bookmark
    @course = Course.find(params[:id])

    if current_user.bookmarked_courses.include?(@course)
      current_user.bookmarked_courses.delete(@course)
      bookmarked = false
    else
      current_user.bookmarked_courses << @course
      bookmarked = true
    end

    respond_to do |format|
      format.json { render json: { bookmarked: bookmarked } }
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to courses_path, status: :see_other, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :description, :price, :thumbnail)
    end    
end
