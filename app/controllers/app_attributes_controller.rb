class AppAttributesController < ApplicationController
  # GET /app_attributes
  # GET /app_attributes.xml
  def index
    @app_attributes = AppAttribute.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @app_attributes }
    end
  end

  # GET /app_attributes/1
  # GET /app_attributes/1.xml
  def show
    @app_attribute = AppAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @app_attribute }
    end
  end

  # GET /app_attributes/new
  # GET /app_attributes/new.xml
  def new
    @app_attribute = AppAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @app_attribute }
    end
  end

  # GET /app_attributes/1/edit
  def edit
    @app_attribute = AppAttribute.find(params[:id])
  end

  # POST /app_attributes
  # POST /app_attributes.xml
  def create
    @app_attribute = AppAttribute.new(params[:app_attribute])

    respond_to do |format|
      if @app_attribute.save
        flash[:notice] = 'AppAttribute was successfully created.'
        format.html { redirect_to(@app_attribute) }
        format.xml  { render :xml => @app_attribute, :status => :created, :location => @app_attribute }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @app_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /app_attributes/1
  # PUT /app_attributes/1.xml
  def update
    @app_attribute = AppAttribute.find(params[:id])

    respond_to do |format|
      if @app_attribute.update_attributes(params[:app_attribute])
        flash[:notice] = 'AppAttribute was successfully updated.'
        format.html { redirect_to(@app_attribute) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @app_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /app_attributes/1
  # DELETE /app_attributes/1.xml
  def destroy
    @app_attribute = AppAttribute.find(params[:id])
    @app_attribute.destroy

    respond_to do |format|
      format.html { redirect_to(app_attributes_url) }
      format.xml  { head :ok }
    end
  end
end
