require 'rails_helper'

RSpec.describe "OmniauthCallbacks", type: :request do
  describe 'Google' do

    context 'Success handling' do

      before(:each) do
        request.env['omniauth.auth'] = FactoryGirl.create(:auth_hash, :google)
        get :google
      end

      let(:user) { User.find_by(email: 'testuser@gmail.com') }

      it 'should set :notice flash' do
        expect(flash[:notice]).to exist
      end

      it 'should set current_user to proper user' do
        expect(subject.current_user).to eq(user)
      end

    end

  end
  describe 'Failure' do

    after(:each) do
      Rails.application.reload_routes!
    end

    before(:each) do

      Rails.application.routes.draw do
        devise_scope :user do
          get '/users/auth/failure' => 'omniauth_callbacks#failure'
        end
        root 'static_pages#index'
      end

      get :failure

    end

    it 'should redirect to root path' do
      expect(response).to redirect_to root_path
    end
  end
end
