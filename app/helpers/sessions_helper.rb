# frozen_string_literal: true

module SessionsHelper
  # returns the path from which a user came. A query parameters called "from" must be present for
  # this method to work properly. We'll pass the other query params as query params to the next page
  def inferred_last_page_path(options = {})
    if params[:from].blank?
      return nil
    end

    query_params = {}
    if options[:allowed_query_params]
      options[:allowed_query_params].each do |query_param|
        query_params[query_param] = params[query_param]
      end
    end

    params[:from] + "?" + query_params.to_query
  end
end
