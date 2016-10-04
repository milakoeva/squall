module Squall
  # OnApp Location Group
  class LocationGroup < Base
    # Public: Lists all location groups.
    #
    # Returns an Array.
    def list
      req = request(:get, '/settings/location_groups.json')
      req.collect { |loc| loc['location_group'] }
    end

    # Public: Retrieves location group info.
    #
    # id - The id of the location group
    #
    # Returns a Hash.
    def show(id)
      req = request(:get, "/settings/location_groups/#{id}.json")
      req.first[1]
    end
  end
end