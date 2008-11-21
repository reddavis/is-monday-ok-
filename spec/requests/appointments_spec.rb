require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a appointment exists" do
  Appointment.delete_all
  request(resource(:appointments), :method => "POST", 
    :params => { :appointment => { :id => nil }})
end

describe "resource(:appointments)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:appointments))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of appointments" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a appointment exists" do
    before(:each) do
      @response = request(resource(:appointments))
    end
    
    it "has a list of appointments" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Appointment.delete_all
          @response = request(resource(:appointments), :method => "POST", 
        :params => { :appointment => { :id => nil }})
    end
    
    it "redirects to resource(:appointments)" do
      @response.should redirect_to(resource(Appointment.first), :message => {:notice => "appointment was successfully created"})
          end
    
  end
end

describe "resource(@appointment)" do 
  describe "a successful DELETE", :given => "a appointment exists" do
     before(:each) do
       @response = request(resource(Appointment.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:appointments))
     end

   end
end

describe "resource(:appointments, :new)" do
  before(:each) do
    @response = request(resource(:appointments, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@appointment, :edit)", :given => "a appointment exists" do
  before(:each) do
    @response = request(resource(Appointment.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@appointment)", :given => "a appointment exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Appointment.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @appointment = Appointment.first
      @response = request(resource(@appointment), :method => "PUT", 
        :params => { :appointment => {:id => @appointment.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@appointment))
    end
  end
  
end

