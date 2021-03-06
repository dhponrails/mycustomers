class CustomersController < ApplicationController
before_filter :login_required, :except => [:opt_in, :opt_out]
before_filter :check_user, :except => [:opt_in, :opt_out]
  # GET /customers
  # GET /customers.xml
  def index
     @mailing_list = MailingList.find(params[:mailing_list_id]) 
     
    @customers = Customer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customers }
    format.csv { 
                   csv_file = Customer.to_csv(current_user.id)
                   send_data csv_file, :type =>  'text/csv', :disposition => 'attachment;
filename=output.csv'

                 

                 }
    end
  end

  # GET /customers/1
  # GET /customers/1.xml
  def show
      @mailing_list = MailingList.find(params[:mailing_list_id])
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer }
      
    end
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
   @mailing_list = MailingList.find(params[:mailing_list_id])
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/1/edit
  def edit
      @mailing_list = MailingList.find(params[:mailing_list_id])
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.xml
  def create
      @mailing_list = MailingList.find(params[:mailing_list_id])
   params[:customer].merge!(:mailing_list_id => @mailing_list.id)
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        flash[:notice] = 'Customer was successfully created.'
        format.html { redirect_to mailing_list_customers_path }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
      @mailing_list = MailingList.find(params[:mailing_list_id])
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        flash[:notice] = 'Customer was successfully updated.'
        format.html { redirect_to mailing_list_customers_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
      @mailing_list = MailingList.find(params[:mailing_list_id])
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to(mailing_list_customers_url) }
      format.xml  { head :ok }
    
    end
  end

  def opt_in
     @code = params[:opt_in_code]
     @customerid = params[:customer_id]
     #redirect_back_or_default('/')
  end
 
  def opt_out
  
  end
 
private
  def check_user
     @mailing_list = MailingList.find(params[:mailing_list_id])
     if @mailing_list.user_id == current_user.id
       
       true      
     else
       flash[:notice] = 'Not authorized'
       redirect_to(@mailing_list)
     end
  end
end
