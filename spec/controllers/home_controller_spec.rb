require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  #check if
  describe "Get Index" do
    it "renders the root path  template" do
      expect(get: root_url(subdomain: nil)).to route_to(
        controller: "home",
        action: "index")
    end
  end

  describe 'post calculate' do
    it 'should render index template a valid result' do
      post 'calculate', expression: '5*3+1+6/2- 3'
      expect(response).to render_template(:index)
      expect(assigns(:result)).to eq(16)
    end

    it 'assigns @result to caliculated value' do
      post 'calculate', expression: '5*3-2.11/2+9*100'
      expect(assigns(:result)).not_to be_nil
      expect(assigns(:result)).to eq( 913.95 )
    end

    it "should print 'Invalid input' if input is empty" do
      post 'calculate', expression: ''
      expect(assigns(:result)).to eq('Invalid input')
    end
  end
end
