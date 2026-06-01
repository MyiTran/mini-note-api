require 'rails_helper'

RSpec.describe "Notes API", type: :request do
  # Test cho cổng GET /notes (Lấy danh sách)
  describe "GET /notes" do
    it "returns a successful response and valid JSON" do
      # Giả lập tạo sẵn 1 cái note trong database test
      Note.create!(title: "Test Title", content: "Test Content")

      #GET lên API
      get "/notes"

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)
      expect(json).to be_an_instance_of(Array)
    end
  end
end