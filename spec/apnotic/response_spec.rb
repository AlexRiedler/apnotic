require 'spec_helper'

describe Apnotic::Response do

  describe "attributes" do
    let(:headers) { double(:headers) }
    let(:body) { double(:body) }
    let(:response) do
      Apnotic::Response.new(headers: headers, body: body)
    end

    subject { response }

    it { is_expected.to have_attributes(headers: headers) }
    it { is_expected.to have_attributes(body: body) }
  end

  describe "#status" do
    let(:status) { double(:status) }
    let(:response) { Apnotic::Response.new(headers: { ':status' => status }) }

    subject { response.status }
    it { is_expected.to eq status }
  end

  describe "#ok?" do
    let(:response) { Apnotic::Response.new(headers: { ':status' => status }) }

    subject { response.ok? }

    context "when status is 200" do
      let(:status) { "200" }
      it { is_expected.to eq true }
    end

    context "when status is not 200" do
      let(:status) { :other }
      it { is_expected.to eq false }
    end
  end
end
