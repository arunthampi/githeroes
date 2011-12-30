require 'spec_helper'

describe HeroesController do
  describe "GET show" do
    let!(:hero)       { Factory(:hero) }

    before do
      get :show, :id => hero.to_param
    end

    it { assigns(:hero).should be_present }
    it { should respond_with :success }
    it { should render_template :show }
  end
end
