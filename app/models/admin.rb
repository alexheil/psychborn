class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:registerable, :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable,:rememberable
end
