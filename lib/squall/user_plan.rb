module Squall
  # OnApp User Billing Plan
  class UserPlan < Base
    # Public: Lists all billing plans.
    #
    # Returns an Array.
    def list
      req = request(:get, '/billing/user/plans.json')
      req.collect { |up| up['user_plan'] }
    end

    # Public: Retrieves billing plan info.
    #
    # id - The id of the billing plan
    #
    # Returns a Hash.
    def show(id)
      req = request(:get, "/billing/user/plans/#{id}.json")
      req.first[1]
    end

    # Public: Create a new billing plan.
    #
    # options - Options for creating the billing plan:
    #           :label         - Label for the billing plan 
    #           :currency_code - Currency type for the billing plan 
    #           :monthly_price - Monthly price of the billing plan
    #
    # Example
    #
    #     create(
    #       label:         'mybp',
    #       currency_code: 'USD',
    #       monthly_price: '10'
    #     )
    #
    # Returns a Hash.
    def create(options = {})
      req = request(:post, '/billing/user/plans.json', default_params(options))
      req.first[1]
    end

    # Public: Add resources to billing plan.
    #
    # options -
    #           :resource_class - the name of the base resource you add to the billing plan in the following format: 
    #                             Resource::[resource_name], where [resource_name] is HypervisorGroup for compute zone limits
    #           :billing_plan_id - the ID of the billing plan
    #           :target_type - the type of the group you add to the billing plan limits, for Limits for compute Zones it is Pack.
    #           :target_id - the ID of the group (or zone) you add to billing plan limits
    #
    # Example
    #
    # 
    # Returns a Hash.
    def add_resource(id, options = {})
      req = request(:post, "/billing/user/plans/#{id}/resources.json", query: { resource: options } )
      req.first[1]
    end
  end
end