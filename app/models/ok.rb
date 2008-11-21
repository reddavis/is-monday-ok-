class Ok < ActiveRecord::Base
  validate :name_blank
  
  belongs_to :okable, :polymorphic => true
  
  private
  
  def name_blank
    errors.add(:'We', "Need Your Name") if name.blank?
  end
  
end
