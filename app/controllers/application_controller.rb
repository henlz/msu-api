class ApplicationController < ActionController::API
  include ActionController::Serialization

  before_action :authenticate_request

  attr_reader :current_user
  # helper_method :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result

    render json: {error: 'Not Authorized'}, status: 401 unless @current_user
  end

  def make_pagination_dict(paginated_collection)
    {
        :current_page  => paginated_collection.current_page,
        :next_page => paginated_collection.next_page,
        :prev_page => paginated_collection.previous_page, # use collection.previous_page when using will_paginate
        :total_pages => paginated_collection.total_pages,
        :total_count => paginated_collection.total_entries # use collection.total_entries when using will_paginate
    }
  end

end