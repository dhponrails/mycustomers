class MailingList < ActiveRecord::Base
has_many :customers
belongs_to :user


end
