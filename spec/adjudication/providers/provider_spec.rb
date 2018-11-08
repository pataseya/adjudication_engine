require "spec_helper"

RSpec.describe Adjudication::Providers::Provider do

  describe 'valid? method' do
    it "must have an npi length of 10 characters" do
      provider =
      Adjudication::Providers::Provider.new
      provider.npi = "0123456789"

      expect(provider.valid?).to  eq(true)
    end
    it "must not have an NPI length of more than 10 characters" do
      provider =
      Adjudication::Providers::Provider.new
      provider.npi = "012345679989"

      expect(provider.valid?).to  eq(false)
    end
    it "must not have an NPI length of less than 10 characters" do
      provider =
      Adjudication::Providers::Provider.new
      provider.npi = "01234589"

      expect(provider.valid?).to  eq(false)
    end
    it "must not have an NPI length that does not exist - is nil" do
      provider =
      Adjudication::Providers::Provider.new
      provider.npi = nil

      expect(provider.valid?).to  eq(false)
    end
    it "must have an NPI that contains only numbers " do
      provider =
      Adjudication::Providers::Provider.new
      provider.npi = "123r567890"

      expect(provider.valid?).to  eq(false)
    end

  end



end
