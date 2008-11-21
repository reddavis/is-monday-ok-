require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/proposed_dates" do
  before(:each) do
    @response = request("/proposed_dates")
  end
end