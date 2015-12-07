class Item < ActiveRecord::Base
  # DB relationship with user (accounts table)
  belongs_to :account
end
