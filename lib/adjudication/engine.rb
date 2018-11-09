require "adjudication/engine/version"
require "adjudication/providers"
require "adjudication/engine/adjudicator"
require "adjudication/engine/claim"

module Adjudication
  module Engine
    def self.run claims_data
      fetcher = Adjudication::Providers::Fetcher.new
      provider_data = fetcher.provider_data

      # TODO filter resulting provider data, match it up to claims data by
      # provider NPI (national provider ID), and run the adjudicator.
      # This method should return the processed claims

# filter provider data to include only valid NPI numbers

      valid_providers = []
      provider_data.each do |prov|
        provider = Adjudication::Providers::Provider.new(prov)
        if @npi.valid?
          valid_providers.push(provider)
        else
          $stderr.puts " ---------- Provider #{@last_name}, NPI of #{@npi} was rejected because #{@npi_alert}."
        end
      end


      puts " Valid Providers: *****************************"
      puts valid_providers



# check claims for valid provider NPI numbers and reject any claims that do not have a valid NPI

      puts "--------------------------------------"
      puts "number of claims sent to be processed: #{claims_data.length}"
      valid_claims = []
      claims_data.each do |claim|
		     if valid_providers.include?(claim["npi"])
		          	valid_claims.push(claim)
		     else
		        $stderr.puts "------- claim number #{claim["number"]} does not have valid provider ID and is out of network. I'm sorry but we cannot process this claim. Please contact your administrator. ------"
		     end

      end
      puts "number of claims that will be processed: #{valid_claims.length}"
      @claims_data = valid_claims




#calling on the adjudicator to process each line in the claim.
            processed_claims = Adjudication::Engine::Adjudicator.new
            @claims_data.each do |claim|
                current_claim = processed_claims.adjudicate(claim)
            end



          []
    end
  end
end
