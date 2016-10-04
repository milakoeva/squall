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

    # Public: List hypervisor groups (compute zones) associated with group.
    #
    # id - ID of user
    #
    # Return a Hash.
    def hypervisor_groups(id)
      response = request(:get, "/settings/location_groups/#{id}/hypervisor_groups.json")
      response.collect { |vm| vm['hypervisor_group']}
    end
  end
end