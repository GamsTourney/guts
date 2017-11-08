class ApplicationController < ActionController::API
  before_action :record_includes

  def record_includes
    @include = {}
    @include[controller_name] = {}
    return unless params[:include]
    params[:include].split(',').each do |k|
      @include[controller_name][k.to_sym] = true
    end
  end

end
