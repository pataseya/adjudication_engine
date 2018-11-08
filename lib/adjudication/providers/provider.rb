module Adjudication
  module Providers
    class Provider
      attr_writer :npi   #shortcut for a getter setter

      def initialize(attributes=[])  #this gives a default value if no array is passed
        @last_name = attributes[0]
        @first_name = attributes[1]
        @npi = attributes[2]
        @practice_name = attributes[3]
        @address_line_1 = attributes[4]
        @address_line_2 = attributes[5]
        @city = attributes[6]
        @state = attributes[7]
        @zip = attributes[8]
        @speciality = attributes[9]
      end

      def valid?
        return false if @npi.nil?   #get the hell out if it's  nil
        return false if @npi.scan(/\D/).length > 0
        #return false if @npi =~ /\D/  #regular expression - returns nil if there are no characters in the string
        @npi.size == 10
      end


    end
  end
end
