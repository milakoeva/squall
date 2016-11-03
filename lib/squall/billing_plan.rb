module Squall
  # OnApp Billing Plan
  class BillingPlan < Base
    # Public: Lists all billing plans.
    #
    # Returns an Array.
    def list
      req = request(:get, '/billing/user/plans.json')
      req.collect { |bp| bp['billing_plan'] }
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
  end
end