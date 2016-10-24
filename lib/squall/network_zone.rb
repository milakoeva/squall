module Squall
  # OnApp NetworkZone
  class NetworkZone < Base
    # Public: Lists all network zones.
    #
    # Returns an Array.
    def list
      response = request(:get, "#{network_zones_route}.json")
      response.collect { |i| i['network_group'] }
    end

    # Public: Get the details for a network zone.
    #
    # id - ID of the network zone
    #
    # Returns a Hash.
    def show(id)
      response = request(:get, "#{network_zones_route}/#{id}.json")
      response['network_group']
    end

    # Public: Updates an existing network zone.
    #
    # id      - ID of the network zone
    # options - Options to update the network zone, see `#create`
    #
    # Returns a Hash.
    def edit(id, options = {})
      request(:put, "#{network_zones_route}/#{id}.json", query:  { pack: options })
    end

    # Public: Creates a new network zone.
    #
    # options - Options for creating the new network zone:
    #           :label - Label for the network zone
    #
    # Returns a Hash.
    def create(options = {})
      request(:post, "#{network_zones_route}.json", query: { pack: options })
    end

    # Public: Deletes an existing network zone.
    #
    # id - ID of the network zone
    #
    # Returns a Hash.
    def delete(id)
      request(:delete, "#{network_zones_route}/#{id}.json")
    end

    # Public: Attach a network to a network zone.
    #
    # id         - ID of the network zone
    # network_id - ID of the network
    #
    # Returns a Hash.
    def attach(id, network_id)
      request(:post, "#{network_zones_route}/#{id}/networks/#{network_id}/attach.json")
    end

    # Public: Detach a network from a network zone.
    #
    # id         - ID of the network zone
    # network_id - ID of the network
    #
    # Returns a Hash.
    def detach(id, network_id)
      request(:post, "#{network_zones_route}/#{id}/networks/#{network_id}/detach.json")
    end

    private

    def network_zones_route
      "/settings/network_zones"
    end
  end
end
