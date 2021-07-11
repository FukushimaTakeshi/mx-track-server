require 'rails_helper'

RSpec.describe 'OffRoadTracksApis', type: :request do
  describe 'GET /off_road_tracks_apis' do
    before do
      create(:off_road_track, name: 'テストコース', prefecture_id: 1)
      get off_road_tracks_path, params: { prefecture_id: 1 }
    end

    it 'httpステータス200が返ること' do
      expect(response).to have_http_status(200)
    end

    it 'レスポンスが想定通り' do
      json = JSON.parse(response.body)
      expect(json.length).to eq 1
      expect(json[0].keys).to contain_exactly('id', 'name')
    end
  end
end
