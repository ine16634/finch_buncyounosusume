class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top,:about,:rule,:index,:show], unless: :admin_controller?
   

  
  private
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end



end
