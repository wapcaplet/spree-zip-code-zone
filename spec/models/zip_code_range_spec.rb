require File.dirname(__FILE__) + '/../spec_helper'

describe ZipCodeRange do
  before(:each) do
    @zip_code_range = ZipCodeRange.new
  end

  it "should be valid" do
    @zip_code_range.should be_valid
  end
end
