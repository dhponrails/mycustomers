class CampaignsController < ApplicationController
before_filter :login_required  
  # GET /campaigns
  # GET /campaigns.xml
  def index
    @campaigns = Campaign.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @campaigns }
    end
  end

  # GET /campaigns/1
  # GET /campaigns/1.xml
  # Render preview!
  def show
    @campaign = Campaign.find(params[:id])
    @design = Design.find_by_id(@campaign.design_id)
    @mailing_lists = MailingList.find_all_by_user_id(current_user.id)
  if correct_user?
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @campaign }
    end
  else
     flash[:notice] = "Cannot view other user's information"
   redirect_to(campaigns_url)
  end
  
  end

  # GET /campaigns/new
  # GET /campaigns/new.xml
  def new
    @campaign = Campaign.new
    @designs = Design.all
    @mailing_lists = MailingList.find_all_by_user_id(current_user.id)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @campaign }
    end
  end

  # GET /campaigns/1/edit
  def edit
    @campaign = Campaign.find(params[:id])
    @designs = Design.all
    @mailing_lists = MailingList.find_all_by_user_id(current_user.id)
      unless @campaign.user_id == current_user.id
        flash[:notice] = 'Incorrect User!'
	redirect_to(campaigns_url) 
      end
  end

  # POST /campaigns
  # POST /campaigns.xml
  def create
    params[:campaign].merge!(:user_id => current_user.id)
    @campaign = Campaign.new(params[:campaign])
    @designs = Design.all
    respond_to do |format|
      if @campaign.save
        flash[:notice] = 'Campaign was successfully created.'
        format.html { redirect_to(@campaign) }
        format.xml  { render :xml => @campaign, :status => :created, :location => @campaign }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campaign.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /campaigns/1
  # PUT /campaigns/1.xml
  def update
    @campaign = Campaign.find(params[:id])
    if correct_user?
    respond_to do |format|
      if @campaign.update_attributes(params[:campaign])
        flash[:notice] = 'Campaign was successfully updated.'
        format.html { redirect_to(@campaign) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campaign.errors, :status => :unprocessable_entity }
      end
    end
    else
     flash[:notice] = 'Incorrect User!'
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.xml
  def destroy
    @campaign = Campaign.find(params[:id])
    if correct_user?
    @campaign.destroy
        
    respond_to do |format|
      format.html { redirect_to(campaigns_url) }
      format.xml  { head :ok }
    end
   else
    flash[:notice] = "You do not have access to do this"
    redirect_to(campaigns_url)
   end
  
  end
  
  def sendmail
          email = params["email"]
	  recipient = email["recipient"]
	  subject = email["subject"]
	  message = email["message"]
          id = params["email_id"]
          user_id = current_user.id

      Emailer.deliver_contact(recipient, subject, message, id, user_id)
      return if request.xhr?
      render :text => 'Message sent successfully'

  
  end
  
  private
  
  



  def correct_user?
    if @campaign.user_id == current_user.id
       true
    else
       false
    end
  end

  
end
