require "spec_helper"

describe OmniAuth::DNAnexus do
  describe "::VERSION" do
    it do
      expect(OmniAuth::DNAnexus::VERSION).to be_a(String)
      expect(Gem::Version.correct?(OmniAuth::DNAnexus::VERSION)).to be(true)
    end
  end
end
