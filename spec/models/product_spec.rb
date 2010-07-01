require 'spec_helper'

describe "Product" do

  describe "inherited as 'Clothes'" do
    
    before(:each) do
      @classification = Classification.create!(:name => 'Clothes')
    end

    it 'should provide constant' do
      lambda { Clothes }.should_not raise_error
    end

    it 'should build a class' do
      Clothes.should be_a(Class)
    end

    it 'should have a name' do
      Clothes.name.should == 'Clothes'
    end

    it 'should refer back to its Classification' do
      Clothes.classification.should == @classification
    end

    it 'should create attribute definition permanantly' do
      lambda {
        @classification.define_attribute! :color, 'String'
      }.should change(AttributeDefinition, :count).by(1)
    end

    describe "with string attribute (color)" do
      before(:each) do
        @classification.define_attribute! :color, 'String'
        @clothes = Clothes.new
      end

      it 'should provide getter method' do
        @clothes.should respond_to(:color)
      end

      it 'should provide setter method' do
        @clothes.should respond_to(:color=)
      end

      it 'should keep color after saving and reloading' do
        lambda {
          @clothes.color = "blue"
        }.should_not raise_error
        @clothes.color.should == "blue"
        @clothes.save!

        @clothes = Product.first
        @clothes.should be_a(Clothes)
        @clothes.color.should == "blue"
      end
    end
    
  end

end
