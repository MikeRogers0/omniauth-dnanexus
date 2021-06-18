require "spec_helper"
require_relative "../../../lib/omniauth/dnanexus/version"

describe OmniAuth::Dnanexus do
  describe "::VERSION" do
    it do
      expect(OmniAuth::Dnanexus::VERSION).to be_a(String)
      expect(Gem::Version.correct?(OmniAuth::Dnanexus::VERSION)).to be(true)
    end
  end
end
