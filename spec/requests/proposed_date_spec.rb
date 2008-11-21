require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/proposed_date" do
  before(:each) do
    @response = request("/proposed_date")
  end
end