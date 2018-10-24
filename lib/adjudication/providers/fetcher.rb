module Adjudication
  module Providers
    class Fetcher
      def provider_data
        # TODO Import CSV data from http://provider-data.beam.dental/beam-network.csv
        # and return it.
          def csv_parser
            provider_data = CSV.open("beam-network.csv", headers: :first_row).map(&:to_h)
            
          end
      end
    end
  end
end
