require File.expand_path('../../spec_helper', __FILE__)

describe Yipit::Client do
  context "api" do
    before(:all) do
      api_key="XZgnp3v2vyrBr3eR"
      @client = Yipit::Client.new(api_key)
    end
    context "divisions" do
      context "search divisions" do
        # use_vcr_cassette
        context "all" do
          before(:all) do
            @divisions = @client.divisions
          end
          context "the results" do
            subject { @divisions }
            specify { should_not be_nil }
            specify { should have_at_least(1).items }
          end
        end
        context "by source" do
          before(:all) do
            @divisions = @client.divisions(:source => "groupon")
          end
          subject { @divisions }
          context "the results" do
            specify { should_not be_nil }
            specify { should have_at_least(1).items }
          end
        end
      end
      context "division details" do
        before(:all) do
          @division = @client.divisions("new-york")
        end
        context "name" do
          specify { @division.name.should == "New York" }
        end
      end
    end
  end
end
