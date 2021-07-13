require "spec_helper"

describe OmniAuth::Strategies::DNAnexus do
  let(:app) do
    lambda do |_env|
      [200, {}, ["Hello."]]
    end
  end

  before { OmniAuth.config.test_mode = true }
  after { OmniAuth.config.test_mode = false }

  describe "#name" do
    subject { described_class.new(app, "client_id", "client_secret", {}).name }

    it { expect(subject).to eq("dnanexus") }
  end

  describe "#client" do
    subject { described_class.new(app, {}).client }

    it "has correct defaults" do
      expect(subject.site).to eq("https://auth.dnanexus.com")
      expect(subject.options[:authorize_url]).to eq("/oauth2/authorize")
      expect(subject.options[:token_url]).to eq("/oauth2/token")
    end

    context "with custom #client_options passed in" do
      subject do
        described_class.new(app, client_options: {
          site: "https://example.com",
          authorize_url: "/example/authorize_url",
          token_url: "/example/token_url"
        }).client
      end

      it do
        expect(subject.site).to eq("https://example.com")
        expect(subject.options[:authorize_url]).to eq("/example/authorize_url")
        expect(subject.options[:token_url]).to eq("/example/token_url")
      end
    end
  end
end
