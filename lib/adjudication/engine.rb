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

      providercount = provider_data.length
      counter = 0
      filtered_provider_data = []
      while counter < providercount
        if provider_data[counter]["NPI"] == nil
          $stderr.puts " ---------- Provider #{provider_data[counter]["Last Name"]} rejected due to missing NPI."
        elsif
          provider_data[counter]["NPI"].length != 10
          $stderr.puts " ---------- Provider #{provider_data[counter]["Last Name"]} rejected due invalid NPI character length."
        else
          filtered_provider_data.push(provider_data[counter])
        end
          counter +=1
      end


      puts " Filtered providers *****************************"
      puts filtered_provider_data

#  create an array of just valid NPI's

      valid_providers = []
      filtered_provider_data.each do |provider|
        valid_providers.push(provider["NPI"])
      end


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
