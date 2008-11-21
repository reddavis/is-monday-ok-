require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/ok" do
  before(:each) do
    @response = request("/ok")
  end
end