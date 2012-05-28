require "spec/spec_helper"

describe Restfolia::EntryPoint do

  context "should apply expansion with valid expression" do
    subject { Restfolia::EntryPoint.new("http://example.com/~{username}/", "search").expansion("username" => "bug") }

    its(:class) { should == Restfolia::EntryPoint      }
    its(:url)   { should == "http://example.com/~bug/" }
    its(:rel)   { should be_nil                        }
  end

  it "should raise exception when url is empty" do
    ep = Restfolia::EntryPoint.new("", "search")
    lambda { ep.expansion(:teste => false) }.should raise_error ArgumentError, Restfolia::ExpansionSupport::INVALID_URL
  end

  it "should raise exception when url is invalid" do
    ep = Restfolia::EntryPoint.new("@@bla", "search")
    lambda { ep.expansion(:teste => false) }.should raise_error ArgumentError, Restfolia::ExpansionSupport::INVALID_URL
  end

  it "should raise exception when params is not a valid hash" do
    ep = Restfolia::EntryPoint.new("http://example.com/~{username}/", "search")
    lambda { ep.expansion(:what) }.should raise_error ArgumentError, Restfolia::ExpansionSupport::INVALID_PARAMETER
  end

end