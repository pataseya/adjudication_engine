module Adjudication
  module Providers
    class Fetcher
      def provider_data
        # TODO Import CSV data from http://provider-data.beam.dental/beam-network.csv
        # and return it.

            provider_data = CSV.read("beam-network.csv", headers: :first_row).map(&:to_h)

      end
    end
  end
end
