require File.expand_path('../../spec_helper', __FILE__)
describe Yipit::Client do
  context "api" do
    before(:all) do
      api_key="XZgnp3v2vyrBr3eR"
      @client = Yipit::Client.new(api_key)
    end
   context "businesses" do
      context "search businesses" do
        # use_vcr_cassette
        before(:all) do
          @businesses = @client.businesses
        end
        specify { @businesses.size.should > 1 }
      end
      context "business details" do
        before(:all) do
          @businesses = @client.businesses("orpheum-theater")
        end
        specify { @business.name.should == "Orpheum Theatre" }
      end
    end
  end
end

