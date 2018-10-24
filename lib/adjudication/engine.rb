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
      providercount = provider_data.length
      counter = 0
      filtered_provider_data = []
      while counter < providercount
        if provider_data[counter]["NPI"] == nil
          $stderr.puts "Provider #{provider_data[counter]["Last Name"]} rejected due to missing NPI"
        elsif
          provider_data[counter]["NPI"].length != 10
          $stderr.puts "Provider #{provider_data[counter]["Last Name"]} rejected due to NPI too short"
        else
        filtered_provider_data.push(provider_data[counter])
        end
        counter +=1
      end
      puts filtered_provider_data

      []
    end
  end
end
