require File.expand_path('../../spec_helper', __FILE__)

describe Yipit::Client do
  context "api" do
    before(:all) do
      api_key=""
      @client = Yipit::Client.new(api_key)
    end
    context "tags" do
      context "search tags" do
        # use_vcr_cassette
        context "all" do
          before(:all) do
            @tags = @client.tags
          end
          context "the results" do
            subject { @tags }
            specify { should_not be_nil }
            specify { should have_at_least(1).items }
          end
        end
      end
      context "when passing params to tags" do
        before(:all) do
          @tag = @client.tags("restaurants")
        end
        context "the tag" do
          subject { @tag }
          specify { should be_nil }
        end
      end
    end
  end
end


