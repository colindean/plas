class PcfgsController < ApplicationController
	before_filter :require_user_admin, :only => [:index, :show, :new, :create, :edit, :update, :destroy]
  # GET /pcfgs
  # GET /pcfgs.xml
  def index
    @pcfgs = Pcfg.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pcfgs }
    end
  end

  # GET /pcfgs/1
  # GET /pcfgs/1.xml
  def show
    @pcfg = Pcfg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pcfg }
    end
  end

  # GET /pcfgs/new
  # GET /pcfgs/new.xml
  def new
    @pcfg = Pcfg.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pcfg }
    end
  end

  # GET /pcfgs/1/edit
  def edit
    @pcfg = Pcfg.find(params[:id])
  end

  # POST /pcfgs
  # POST /pcfgs.xml
  def create
    @pcfg = Pcfg.new(params[:pcfg])
    @pcfg.last_modified_by = current_user

    respond_to do |format|
      if @pcfg.save
        format.html { redirect_to(pcfgs_url, :notice => 'Pcfg was successfully created.') }
        format.xml  { render :xml => @pcfg, :status => :created, :location => @pcfg }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pcfg.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pcfgs/1
  # PUT /pcfgs/1.xml
  def update
    @pcfg = Pcfg.find(params[:id])

    respond_to do |format|
      if @pcfg.update_attributes(params[:pcfg])
        format.html { redirect_to(pcfgs_url, :notice => 'Pcfg was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pcfg.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pcfgs/1
  # DELETE /pcfgs/1.xml
  def destroy
    @pcfg = Pcfg.find(params[:id])
    @pcfg.destroy

    respond_to do |format|
      format.html { redirect_to(pcfgs_url) }
      format.xml  { head :ok }
    end
  end
end
