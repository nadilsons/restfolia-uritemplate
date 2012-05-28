require 'spec/spec_helper'

describe Restfolia do

  let(:url) { "http://local.tester.anti.bug/resource/index" }
  before { register_uri(:get, url, :body => fixture('index.json')) }

  subject { Restfolia.at(url).get.link('search').expansion(:term => "dog") }

  its(:class) { should == Restfolia::EntryPoint                }
  its(:url)   { should == "http://local.tester.anti.bug/d/dog" }
  its(:rel)   { should be_nil                                  }

end