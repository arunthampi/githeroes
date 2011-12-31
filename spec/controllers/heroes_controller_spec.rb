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

  describe "POST create" do
    context "user with that Github login exists" do
      let!(:existing_hero)  { Factory(:hero, :login => 'arunthampi') }

      def do_request
        xhr :post, :create, :hero => {
                                        "type"=>"User",
                                        "following"=>"18",
                                        "blog"=>"http://posterous.mclov.in",
                                        "login"=>"arunthampi",
                                        "public_repos"=>"24",
                                        "hireable"=>"false",
                                        "bio"=>"",
                                        "location"=>"Singapore",
                                        "company"=>"http://anideo.com",
                                        "email"=>"arun.thampi@gmail.com",
                                        "avatar_url"=>"https://secure.gravatar.com/avatar/ca448f8bc4c932c6e691202a05a095a3?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
                                        "url"=>"https://api.github.com/users/arunthampi",
                                        "gravatar_id"=>"ca448f8bc4c932c6e691202a05a095a3",
                                        "html_url"=>"https://github.com/arunthampi",
                                        "created_at"=>"2008-02-27T09:25:52Z",
                                        "name"=>"Arun Thampi",
                                        "id"=>"1048",
                                        "public_gists"=>"39",
                                        "followers"=>"30"
                                     }
      end

      it "should create a new Hero" do
        expect {
          do_request
        }.to change(Hero, :count).by(0)

        assigns(:hero).login.should == 'arunthampi'
      end

      it "should respond with success" do
        do_request
        response.should be_success
      end

      it "should render template create" do
        do_request
        response.should render_template :create
      end
    end

    context "user with that Github login does not exist" do
      def do_request
        xhr :post, :create, :hero => {
                                        "type"=>"User",
                                        "following"=>"18",
                                        "blog"=>"http://posterous.mclov.in",
                                        "login"=>"arunthampi",
                                        "public_repos"=>"24",
                                        "hireable"=>"false",
                                        "bio"=>"",
                                        "location"=>"Singapore",
                                        "company"=>"http://anideo.com",
                                        "email"=>"arun.thampi@gmail.com",
                                        "avatar_url"=>"https://secure.gravatar.com/avatar/ca448f8bc4c932c6e691202a05a095a3?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
                                        "url"=>"https://api.github.com/users/arunthampi",
                                        "gravatar_id"=>"ca448f8bc4c932c6e691202a05a095a3",
                                        "html_url"=>"https://github.com/arunthampi",
                                        "created_at"=>"2008-02-27T09:25:52Z",
                                        "name"=>"Arun Thampi",
                                        "id"=>"1048",
                                        "public_gists"=>"39",
                                        "followers"=>"30"
                                     }
      end

      it "should create a new Hero" do
        expect {
          do_request
        }.to change(Hero, :count).by(1)

        assigns(:hero).login.should == 'arunthampi'
      end

      it "should respond with success" do
        do_request
        response.should be_success
      end

      it "should render template create" do
        do_request
        response.should render_template :create
      end
    end
  end

end
