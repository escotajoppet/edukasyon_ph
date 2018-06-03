class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_parent

  def index
    @reviews = @class_schedule.nil? ? @parent.reviews : @class_schedule.reviews
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.reviewable = @class_schedule.nil? ? @parent : @class_schedule

    respond_to do |format|
      if @review.save
        format.html { redirect_to polymorphic_path([@parent, @class_schedule, Review]), notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to polymorphic_path([@parent, @class_schedule, Review]), notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_path([@parent, @class_schedule, Review]), notice: 'Review was successfully destroyed.' }
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def set_parent
      @parent = Professor.find(params[:professor_id]) if params[:professor_id]
      @parent = Subject.find(params[:subject_id]) if params[:subject_id]
      @parent = Student.find(params[:student_id]) if params[:student_id]
      @class_schedule = ClassSchedule.find(params[:class_schedule_id]) if params[:class_schedule_id]
    end
    
    def review_params
      params.require(:review).permit(:name, :rating, :description)
    end
end
