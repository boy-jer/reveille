require 'spec_helper'

describe DashboardController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET 'index'" do
    before { get :index }

    it { should respond_with(:success) }
    it { should render_template(:dashboard) }
  end

end
