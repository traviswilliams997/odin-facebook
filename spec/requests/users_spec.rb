require 'rails_helper'

RSpec.describe '/users', type: :request do

    describe 'GET /show' do
        it 'renders a successful response' do
          user = create(:user, first_name: "Pauline", last_name: "Black", password: "password", id: 2)
          get user_url(user)
          expect(response.status).to eql(302)
        end
      end

end