class StepsController < ApplicationController
  before_filter :load_howto

  # GET /steps
  # GET /steps.json
  def index
    @steps = @howto.steps.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @steps }
    end
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
    @step = @howto.steps.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @step }
    end
  end

  # GET /steps/new
  def new
    @step = @howto.steps.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @step }
    end
  end

  # GET /steps/1/edit
  def edit
    @step = @howto.steps.find(params[:id])
  end

  # POST /steps
  # POST /steps.json
  def create
    @step = @howto.steps.find(params[:step])

    respond_to do |format|
      if @step.save
        format.html { redirect_to @step, notice: 'Step was successfully created.' }
        format.json { render action: 'show', status: :created, location: @step }
      else
        format.html { render action: 'new' }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1
  # PATCH/PUT /steps/1.json
  def update
    @step = @howto.steps.find(params[:id])
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to [@howto, @step], notice: 'Step was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    @step = @howto.steps.find(params[:id])
    @step.destroy
    respond_to do |format|
      format.html { redirect_to howto_steps_path(@howto) }
      format.json { head :no_content }
    end
  end

  private

  def load_howto
    @howto = Howto.find(params[:howto_id])
  end
end
