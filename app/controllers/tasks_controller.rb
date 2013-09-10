class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_project
  # GET /tasks
  # GET /tasks.json


  def index
    @tasks = @project.tasks
    if params[:search].presence
      @tasks = @tasks.search(params[:search])
    end
    @tasks = @tasks.sort_by!{|task| task.days_til_due}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
      format.js {render :tasks}
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = @project.tasks.find(params[:id])

    #return redirect_to(index) unless @task.user == current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @task.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = @project.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @task.user = current_user
    @task.project = @project

    respond_to do |format|
      if @task.save
        format.html { redirect_to project_task_url(@project,@task), notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = @project.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to project_task_url(@project,@task), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end 
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = @project.tasks.find(id: params[:id], user: current_user)
    @task.destroy

    respond_to do |format|
      format.html { redirect_to project_tasks_url(@project) }
      format.json { head :no_content }
    end
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

end
