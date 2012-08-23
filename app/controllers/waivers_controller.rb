class WaiversController < ApplicationController
  before_filter :require_permission_waivers_administrate, :except => :show

  def index
    @waivers = Waiver.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @waivers }
    end
    return
  end

  def show
    @waiver = Waiver.find params[:id]
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, 
                                        :autolink => true, 
                                        :space_after_headers => true) 
    respond_to do |format|
      format.html
      format.xml { render :xml => @waiver }
      format.pdf { render :text => WickedPdf.new.pdf_from_string(@markdown.render(@waiver.body)) }
    end
    return
  end

  def new
    @waiver = Waiver.new

    respond_to do |format|
      format.html
      format.xml { render :xml => @waiver }
    end
    return
  end

  def edit
    @waiver = Waiver.find params[:id]
  end

  def create
    @waiver = Waiver.new(params[:waiver])
    
    respond_to do |format|
      if @waiver.save
        format.html { redirect_to(waivers_url, :notice => _('Waiver was successfully created.')) }
        format.xml { render :xml => @waiver, :status => :created, :location => @waiver }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @waiver.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @waiver = Waiver.find params[:id]
    respond_to do |format|
      if @waiver.update_attributes(params[:waiver])
        format.html { redirect_to(waivers_url, :notice => _('Waiver was successfully updated.')) }
        format.xml { render :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @waiver.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @waiver = Waiver.find params[:id]
    @waiver.destroy

    respond_to do |format|
      format.html { redirect_to(waivers_url) }
      format.xml { head :ok }
    end
  end

  protected

  def require_permission_waivers_administrate
    user_can 'waivers.administrate', _('You must be a waiver administrator to access this page.')
  end
end
