require File.expand_path('../../spec_helper', __FILE__)

describe Yipit::Client do
  context "api" do
    before(:all) do
      api_key="XZgnp3v2vyrBr3eR"
      @client = Yipit::Client.new(api_key)
    end
    context "deals" do
      context "search" do
        context "with no args" do
          use_vcr_cassette
          before(:all) do
            @deals = @client.deals
          end
          subject { @deals }
          it { should_not be_nil }
          it { should be_an(Array) }
          it { should have(20).items }
        end
        context "with Brooklyn, NY lat/long" do
          before(:all) do
            @deals = @client.deals(:lat => "40.7325859", :lon => "-73.9568557")
          end
          subject { @deals }
          it { should_not be_nil }
          subject { @deals.first.division.name }
          it { should eql "New York" }
          subject { @deals.last.division.name }
          it { should eql "New York" }
        end
        # TODO:  Better test.
        context "with Brooklyn, NY lat/long, scoped to a 2 mile radius" do
          before(:all) do
            @deals = @client.deals(:lat => "40.7325859", :lon => "-73.9568557", :radius => 2)
          end
          subject { @deals }
          it { should_not be_nil }
          subject { @deals.first.division.name }
          it { should eql "New York" }
          subject { @deals.last.division.name }
          it { should eql "New York" }
        end
        context "from Groupon" do
          before(:all) do
            @deals = @client.deals(:source => "Groupon")
          end
          subject { @deals }
          it { should_not be_nil }
          context "source name" do
            subject { @deals.first.source.name }
            it { should eql "Groupon" }
            subject { @deals.last.source.name }
            it { should eql "Groupon" }
          end
        end
        context "by phone number" do
          before(:all) do
            @deals = @client.deals(:phone => "718-599-2700")
          end
          subject { @deals }
          it { should_not be_nil }
          subject { @deals.first.business.name.strip }
          it { should eql "Kenny's Trattoria" }
        end
        context "tagged with 'restaurants'" do
          before(:all) do
            @deals = @client.deals(:tag => "restaurants")
          end
          subject { @deals }
          it { should_not be_nil }
          subject { @deals.first.tags.first.name }
          it { should eql "Restaurants" }
          subject { @deals.last.tags.first.name }
          it { should eql "Restaurants" }
        end
        context "paid deals'" do
          before(:all) do
            @deals = @client.deals(:paid => "true")
            require 'pp'
            puts @deals.inspect
          end
          subject { @deals }
          it { should_not be_nil }
        end
      end
      context "details" do
        before(:all) do
          @deal = @client.deals(7238)
        end
        subject { @deal }
        it { should_not be_nil }
        it { should be_a(Hashie::Mash) }
        it { should respond_to(:id) }
        it { should respond_to(:title) }
        it { should respond_to(:business) }
        it { should respond_to(:images) }
        it { should respond_to(:business) }
        it { should respond_to(:division) }
        it { should respond_to(:source) }
        it { should respond_to(:tags) }
        # etc...
      end
    end
  end
end
