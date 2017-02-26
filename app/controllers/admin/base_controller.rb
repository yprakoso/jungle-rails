class Admin::BaseController < ApplicationController
  before_filter :admin_required
  def admin_required
    self.class.http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  end
end
