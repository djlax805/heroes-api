require 'rails_helper'

describe "GET /:heroes" do
  let!(:heroes)      { create_list :hero, 5 }
  let(:parsed_body) { JSON.parse response.body }

  before do
    get '/heroes'
  end

  it 'succeeds' do
    expect(response.code).to eq '200'
  end

  it 'does not include any relationships' do
    expect(parsed_body.keys).to contain_exactly 'data'
  end

  describe 'data' do
    let(:list_data) { parsed_body['data'] }

    it 'has a list of heroes' do
      expect(response.body).to have_json_path 'data'
      expect(list_data.size).to eq heroes.size
      expect(list_data.map { |s| s['type'] }).to all(eq 'hero')
    end

    it 'only has the the heroes\' names' do
      attributes = list_data.map do |hero|
        hero['attributes'].keys
      end.flatten

      expect(attributes).to all(eq 'name')
    end
  end
end
