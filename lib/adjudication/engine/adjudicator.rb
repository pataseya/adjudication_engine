module Adjudication
  module Engine
    class Adjudicator
      attr_reader :processed_claims

      def initialize
        @processed_claims = []
      end


      def adjudicate(claim)
        # TODO implement adjudication rules, and add any processed claims (regardless
        # of status) into the processed_claims attribute.

        #  current_claim = Claim.new(@claims_data[0])
        #  puts current_claim
        puts claim 
      end


    end
  end
end
