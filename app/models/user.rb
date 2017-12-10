class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def have_permission?
    is_admin?
  end

  def is_admin?
    email == 'navaleganesh2011@gmail.com'
  end

end
