class Admin::DashboardsController < ApplicationController
    layout 'application'
    before_action :authenticate_admin!
    def index
        @users = User.all
    end
end
