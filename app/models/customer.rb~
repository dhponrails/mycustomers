class Customer < ActiveRecord::Base
include Authentication
  
belongs_to :mailing_list

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  def self.to_csv(id)
    csv_file = "first name, last name, birthmonth, birthday, email \n"
    @customers = MailingList.find_by_user_id(id).customers
    @customers.each do |customer|
      csv_file << "#{customer.firstname}, #{customer.lastname}, #{customer.birthmonth}, #{customer.birthday}, #{customer.email}\n"
      
    end
    csv_file
  end

end
