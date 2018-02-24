class ApplicationController < ActionController::API
  before_action :record_includes

  def record_includes
    @include = {}
    return unless params[:include]
    @include[controller_name] = {}
    params[:include].split(',').each do |k|
      @include[controller_name][k.to_sym] = true
    end
  end

end
