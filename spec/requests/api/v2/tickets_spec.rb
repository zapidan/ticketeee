require "rails_helper"

describe API::V2::Tickets do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) { FactoryGirl.create(:ticket, project: project) }
  let(:url) { "/api/v2/projects/#{project.id}/tickets/#{ticket.id}" }
  let(:headers) do
    { "HTTP_AUTHORIZATION" => "Token token=#{user.api_key}" }
  end

  before do
    assign_role!(user, :manager, project)
    user.generate_api_key
  end

  context "successful requests" do
    it "can view a ticket's details" do
      get url, {}, headers
      expect(response.status).to eq 200
      json = TicketSerializer.new(ticket).to_json
      expect(response.body).to eq json
    end
  end

  context "unsuccessfull requests" do
    it "doesn't allow requests that don't pass through an API key" do
      get url
      expect(response.status).to eq 401
      expect(response.body).to include "Unauthenticated"
    end

    it "doesn't allow requests that pass an invalid API key" do
      get url, {}, { "HTTP_AUTHORIZATION" => "Token token=notvalidkey" }
      expect(response.status).to eql 401
      expect(response.body).to include "Unauthenticated"
    end

    it "doesn't allow access to a ticket that the user doesn't have permission to read" do
      project.roles.delete_all
      get url, {}, headers
      expect(response.status).to eq 404
    end
  end
end