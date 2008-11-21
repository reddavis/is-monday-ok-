class ProposedDate < ActiveRecord::Base
  validate :name_blank, :date_blank, :start_time_blank
  
  belongs_to :appointment
  has_many :oks, :as => :okable
  
  private
  
  def date_blank
    errors.add(:'The Date', "Can't Be Blank") if date.blank?
  end
  
  def name_blank
    errors.add(:'We', "Need Your Name") if name.blank?
  end
  
  def start_time_blank
    errors.add(:'The Start Time', "Can't Be Blank") if start_time.blank?
  end
  
end
