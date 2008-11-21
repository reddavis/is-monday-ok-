require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/vote" do
  before(:each) do
    @response = request("/vote")
  end
end