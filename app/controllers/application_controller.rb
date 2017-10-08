class ApplicationController < ActionController::API
  before_action :record_includes

  def record_includes
    @include = {}
    return unless params[:include]
    params[:include].split(',').each do |k|
      @include[k.to_sym] = true
    end
  end

end
