require 'spec_helper'

describe "Product" do
  describe "with Classification named 'Fueller'" do
    before(:each) do
      @classification = Classification.create!(:name => 'Fueller')
    end
    it 'should provide class' do
      lambda {
        Fueller
      }.should_not raise_error
    end

    it "should respond to Classification's attributes"
  end
end
