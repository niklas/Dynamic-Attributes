require 'spec_helper'

describe "Product" do
  describe "with Classification named 'Fueller'" do
    before(:each) do
      @classification = Classification.create!(:name => 'Fueller')
      @classification.define_attribute! :ink_color, 'String'
    end
    it 'should provide class' do
      lambda {
        Fueller
      }.should_not raise_error
    end

    it "should respond to Classification's attributes" do
      @product = Fueller.new
      lambda {
        @product.ink_color = "blue"
      }.should_not raise_error
      @product.ink_color.should == "blue"
      @product.save!
      @product.reload
      ### das ist geschummelt, relead richtig
      @product.ink_color.should == "blue"
    end
  end
end
