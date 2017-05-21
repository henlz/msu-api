class ApplicationController < ActionController::API
  before_action :authenticate_request

  attr_reader :current_user
  # helper_method :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result

    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def pagination_dict(collection)
    {
      objects: collection,
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.previous_page, # use collection.previous_page when using will_paginate
      total_pages: collection.total_pages,
      total_count: collection.total_entries # use collection.total_entries when using will_paginate
    }
  end

end