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

    it 'should build a class' do
      Fueller.should be_a(Class)
    end

    it 'should have a name' do
      Fueller.name.should == 'Fueller'
    end

    it 'should refer back to Classification' do
      Fueller.classification.should == @classification
    end

    it "should respond to Classification's attributes" do
      @product = Fueller.new
      lambda {
        @product.ink_color = "blue"
      }.should_not raise_error
      @product.ink_color.should == "blue"
      @product.save!

      @product = Product.first
      @product.should be_a(Fueller)
      @product.ink_color.should == "blue"
    end
  end
end
