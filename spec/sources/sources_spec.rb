require File.expand_path('../../spec_helper', __FILE__)

describe Yipit::Client do
  context "api" do
    before(:all) do
      api_key="XZgnp3v2vyrBr3eR"
      @client = Yipit::Client.new(api_key)
    end
    context "sources" do
      context "search sources" do
        # use_vcr_cassette
        context "all" do
          before(:all) do
            @sources = @client.sources
          end
          context "the results" do
            subject { @sources }
            specify { should_not be_nil }
            specify { should have_at_least(1).items }
          end
        end
        context "by division" do
          before(:all) do
            @sources = @client.sources(:divisions => "new-york")
          end
          subject { @sources }
          context "the results" do
            specify { should_not be_nil }
            specify { should have_at_least(1).items }
          end
        end
      end
      context "source details" do
        before(:all) do
          @source = @client.sources("groupon")
        end
        context "name" do
          specify { @source.name.should == "Groupon" }
        end
      end
    end
  end
end

