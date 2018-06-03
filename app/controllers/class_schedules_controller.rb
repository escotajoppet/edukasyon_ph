class ClassSchedulesController < ApplicationController
  before_action :set_class_schedule, only: [:show, :edit, :update, :destroy, :enroll, :drop]
  before_action :set_parent

  def index
    @class_schedules = ClassSchedule.all
    @class_schedules = Professor.find(params[:professor_id]).class_schedules if params[:professor_id]
    @class_schedules = Subject.find(params[:subject_id]).class_schedules if params[:subject_id]
    @class_schedules.includes!([:reviews, :professor, :subject])
  end

  def show
  end

  def new
    @class_schedule = ClassSchedule.new
  end

  def edit
  end

  def create
    @class_schedule = ClassSchedule.new(class_schedule_params)
    # @class_schedule.days = params[:days_index].present? ? params[:days_index].join() : ''
    @class_schedule.professor = Professor.find(params[:professor_id])
    @class_schedule.subject = Subject.find(params[:subject_id])

    respond_to do |format|
      if @class_schedule.save
        format.html { redirect_to polymorphic_path([@parent, @class_schedule]), notice: 'Class schedule was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      # @class_schedule.days = params[:days_index].present? ? params[:days_index].join() : ''
      @class_schedule.professor = Professor.find(params[:professor_id])
      @class_schedule.subject = Subject.find(params[:subject_id])

      if @class_schedule.update(class_schedule_params)
        format.html { redirect_to polymorphic_path([@parent, @class_schedule]), notice: 'Class schedule was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @class_schedule.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_path([@parent, ClassSchedule]), notice: 'Class schedule was successfully destroyed.' }
    end
  end

  def enroll
    @parent.class_schedules << @class_schedule
    @parent.save

    respond_to do |format|
      format.html { redirect_to polymorphic_path([@parent, ClassSchedule]), notice: 'Student was successfully enrolled to class' }
    end
  end

  def drop
    @parent.class_schedules.delete(@class_schedule)
    @parent.save

    respond_to do |format|
      format.html { redirect_to polymorphic_path([@parent, ClassSchedule]), notice: 'Student was successfully dropped out of class' }
    end
  end

  private

    def set_class_schedule
      @class_schedule = ClassSchedule.find(params[:id])
    end

    def set_parent
      @parent = Professor.find(params[:professor_id]) if params[:professor_id]
      @parent = Subject.find(params[:subject_id]) if params[:subject_id]
      @parent = Student.find(params[:student_id]) if params[:student_id]
    end
    
    def class_schedule_params
      params.require(:class_schedule).permit(:time_schedule, :days, :room, :days_index)
    end
end
