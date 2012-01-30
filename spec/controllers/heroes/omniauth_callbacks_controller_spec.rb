require 'spec_helper'

describe Heroes::OmniauthCallbacksController do
  before do
    request.env["devise.mapping"] = Devise.mappings[:hero]

    OmniAuth.config.mock_auth[:github] = {
      "provider" => "github",
      "uid" => "fake_github_id",
      "credentials" => { "token" => "fake_token", "expires" => false },
      "extra" => {
        "raw_info" => {
          "avatar_url" => "https://secure.gravatar.com/avatar/ca448f8bc4c932c6e691202a05a095a3?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
          "bio" => "",
          "blog" => "http://posterous.mclov.in",
          "collaborators" => 1,
          "company" => "http://anideo.com",
          "created_at" => "2008-02-27T09:25:52Z",
          "disk_usage" => 45524,
          "email" => "arun.thampi@gmail.com",
          "followers" => 30,
          "following" => 18,
          "gravatar_id" => "ca448f8bc4c932c6e691202a05a095a3",
          "hireable" => false,
          "html_url" => "https://github.com/arunthampi",
          "id" => 1048,
          "location" => "Singapore",
          "login" => "arunthampi",
          "name" => "Arun Thampi",
          "owned_private_repos" => 6,
          "plan" => {
            "collaborators" => 5,
            "name" => "small",
            "private_repos" => 10,
            "space" => 1228800
          },
          "private_gists" => 5,
          "public_gists" => 39,
          "public_repos" => 24,
          "total_private_repos" => 6,
          "type" => "User",
          "url" => "https://api.github.com/users/arunthampi"
        }
      }
    }


    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end

  context "provider is Github" do
    def do_request
      get :github
    end

    context "hero does not exist" do
      it "should create a new hero with the proper github data" do
        expect {
          do_request
        }.to change(Hero, :count).by(1)

        hero = Hero.first

        hero.email.should == 'arun.thampi@gmail.com'
        hero.avatar_url.should == "https://secure.gravatar.com/avatar/ca448f8bc4c932c6e691202a05a095a3?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"
        hero.name.should == "Arun Thampi"
        hero.login.should == "arunthampi"
      end

      it "should create a new access token" do
        do_request

        hero = Hero.first
        hero.access_tokens.first.should be_present
        hero.access_tokens.first.token.should == 'fake_token'
        hero.access_tokens.first.uid.should == 'fake_github_id'
        hero.access_tokens.first.provider.should == 'github'
      end

      it "should redirect to root_path" do
        do_request
        response.should redirect_to root_path(:ref => 'oauth')
      end
    end

    context "hero does exist" do
      before do
        @hero = Factory(:hero, :login => 'arunthampi')
        @access_token = Factory(:access_token, :hero => @hero, :token => 'existing_fake_token',
                                               :uid => 'fake_github_id', :provider => 'github')
      end

      it "should NOT create a new hero" do
        expect {
          do_request
        }.to change(Hero, :count).by(0)
      end

      it "should replace the existing access token with a new one" do
        do_request

        hero = Hero.first
        hero.access_tokens.first.should be_present
        hero.access_tokens.first.token.should == 'fake_token'
        hero.access_tokens.first.uid.should == 'fake_github_id'
        hero.access_tokens.first.provider.should == 'github'
      end
    end
  end
end