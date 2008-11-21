require 'digest/sha1'
class Appointment < ActiveRecord::Base
  validate :date_blank, :event_blank, :start_time_blank
  after_create :generate_stub
  
  has_many :oks, :as => :okable
  has_many :proposed_dates
    
  private
  
  def generate_stub
    string = "#{event_name}_#{Time.now}_#{rand(999999)}"
    mix_up = Digest::SHA1.hexdigest(string)
    final = "#{id}_#{mix_up.slice(0..5)}"
    self.stub = final
    self.save!
  end
  
  def date_blank
    errors.add(:'The Date', "Can't Be Blank") if date.blank?
  end
  
  def event_blank
    errors.add(:'The Event', "Can't Be Blank") if event_name.blank?
  end
  
  def start_time_blank
    errors.add(:'The Start Time', "Can't Be Blank") if start_time.blank?
  end
  
end
