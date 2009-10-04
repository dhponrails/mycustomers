class MailingList < ActiveRecord::Base
has_many :customers, :dependent => :destroy
belongs_to :user


end
