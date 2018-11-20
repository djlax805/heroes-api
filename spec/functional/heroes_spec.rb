require 'rails_helper'

describe "retrieving a list of heroes" do
  let(:expected_hero_list) do
    YAML
      .load_file('spec/fixtures/heroes_index.yml')
      .to_json
  end

  before :all do
    listing_url = 'http://localhost:3000/heroes'
    @response = HTTParty.get listing_url
  end

  it 'responds with 200' do
    expect(@response.code).to eq 200
  end

  it 'has a content-type of JSON' do
    content_type = @response.content_type
    expect(content_type).to eq "application/json"
  end

  it 'successfully retrieves a list of hero names' do
    expect(@response).to be_success
  end

  it 'lists the serialized heroes correctly' do
    expect(@response.body).to eq expected_hero_list
  end
end
