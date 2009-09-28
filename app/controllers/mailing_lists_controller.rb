class MailingListsController < ApplicationController
  # GET /mailing_lists
  # GET /mailing_lists.xml
  def index
    @mailing_lists = MailingList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mailing_lists }
    end
  end

  # GET /mailing_lists/1
  # GET /mailing_lists/1.xml
  def show
    @mailing_list = MailingList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mailing_list }
    end
  end

  # GET /mailing_lists/new
  # GET /mailing_lists/new.xml
  def new
    @mailing_list = MailingList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mailing_list }
    end
  end

  # GET /mailing_lists/1/edit
  def edit
    @mailing_list = MailingList.find(params[:id])
  end

  # POST /mailing_lists
  # POST /mailing_lists.xml
  def create
    @mailing_list = MailingList.new(params[:mailing_list])

    respond_to do |format|
      if @mailing_list.save
        flash[:notice] = 'MailingList was successfully created.'
        format.html { redirect_to(@mailing_list) }
        format.xml  { render :xml => @mailing_list, :status => :created, :location => @mailing_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mailing_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mailing_lists/1
  # PUT /mailing_lists/1.xml
  def update
    @mailing_list = MailingList.find(params[:id])

    respond_to do |format|
      if @mailing_list.update_attributes(params[:mailing_list])
        flash[:notice] = 'MailingList was successfully updated.'
        format.html { redirect_to(@mailing_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mailing_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mailing_lists/1
  # DELETE /mailing_lists/1.xml
  def destroy
    @mailing_list = MailingList.find(params[:id])
    @mailing_list.destroy

    respond_to do |format|
      format.html { redirect_to(mailing_lists_url) }
      format.xml  { head :ok }
    end
  end
end
