class Account < ActiveRecord::Base
  has_many :transactions
  validates_presence_of :name, :message => "must be provided"
  validates_numericality_of :account_type, :allow_nil => false, :message => "must be a number"
end
