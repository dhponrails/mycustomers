class Emailer < ActionMailer::Base

  
  def contact(recipient, subject, message, id, user_id, sent_at = Time.now)
   #must also verify if current_user
     @campaign = Campaign.find_by_id(id)
     if @campaign.user_id == user_id
       @design = Design.find_by_id(@campaign.design_id)     	
  

   
   
   
  #  @mailing_lists = MailingList.find_all_by_user_id(current_user.id)
##    recipients [recipient]
##    from "dustinhuypham@gmail.com"
##    subject 'test'
##    
##    content_type "multipart/alternative"
##     part(:content_type => "text/html",
##         :body => render_message("contact", :message => message)
##   

##    part 'multipart/related' do |p|
##      # This next line makes it all work
##      p.content_type='text/html'
##            p.part :content_type => 'text/html',
##             :body => render_message('registration_notifier_html', :message => message)


##      p.part :content_type => 'image/gif',
##             :content_disposition => 'inline',
##             :transfer_encoding => 'base64',
##             :body => File.read("#{RAILS_ROOT}/public/images/designs/2.png")

##    end
  content_type  'text/html'
      @subject = subject
      @recipients = recipient
      @from = 'no-reply@yourdomain.com'
      @sent_on = sent_at
	  @body["title"] = 'This is title'
  	  @body["email"] = 'sender@yourdomain.com'
   	  @body["message"] = message
      @headers = {}
   else
     flash[:notice] = 'Can only send own campaigns.'
      
   end
  end


end
