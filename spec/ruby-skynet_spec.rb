require_relative '../lib/ruby-skynet.rb'

describe Skynet, "#strip_prefix" do
  context "with a string containing URI_SKYNET_PREFIX" do
    it "should strip of the URI_SKYNET_PREFIX" do
      strip = Skynet.strip_prefix('sia://test')
      expect(strip).to eq('test')
    end
  end

  context "with a string not containing URI_SKYNET_PREFIX" do
    it "should return exact same string" do
      strip = Skynet.strip_prefix('test')
      expect(strip).to eq('test')
    end
  end

  context "with an empty string" do
    it "should return empty string" do
      strip = Skynet.strip_prefix('')
      expect(strip).to eq('')
    end
  end
end
