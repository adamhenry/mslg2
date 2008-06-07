class ShipsController < ApplicationController
  # GET /ships
  # GET /ships.xml
  def index
    @ships = Ship.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ships }
    end
  end

  # GET /ships/1
  # GET /ships/1.xml
  def show
    @ship = Ship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ship }
    end
  end

  # GET /ships/new
  # GET /ships/new.xml
  def new
    @ship = Ship.new
    @locations = Location.find :all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ship }
    end
  end

  # GET /ships/1/edit
  def edit
    @ship = Ship.find(params[:id])
    @locations = Location.find :all
  end

  # POST /ships
  # POST /ships.xml
  def create
	raise "OHSHIT"
    @ship = Ship.new(params[:ship].merge( :locatoin => Location.find_by_name(params[location]) ))

    respond_to do |format|
      if @ship.save
        flash[:notice] = 'Ship was successfully created.'
        format.html { redirect_to(@ship) }
        format.xml  { render :xml => @ship, :status => :created, :location => @ship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ships/1
  # PUT /ships/1.xml
  def update
    @ship = Ship.find(params[:id])

    respond_to do |format|
      if @ship.update_attributes(params[:ship])
        flash[:notice] = 'Ship was successfully updated.'
        format.html { redirect_to(@ship) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ships/1
  # DELETE /ships/1.xml
  def destroy
    @ship = Ship.find(params[:id])
    @ship.destroy

    respond_to do |format|
      format.html { redirect_to(ships_url) }
      format.xml  { head :ok }
    end
  end
end