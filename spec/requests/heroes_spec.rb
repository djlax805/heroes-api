require 'rails_helper'

describe "GET /:heroes" do
  let(:expected_hero_list) do
    {
        'hero_names' => [
            "Junkrat",
            "Mei",
            "Reaper",
            "Rheinhardt",
            "Widowmaker",
            "Mercy",
            "Lucio",
            "Symmetra",
            "Zenyatta",
            "Hanzo",
            "Bastion",
            "Torbjorn",
            "Tracer",
            "Soldier 76",
            "Roadhog",
            "D. Va",
            "Zarya",
            "Genji",
            "McCree",
            "Pharah",
            "Winston",
            "Ana"
        ]
    }.to_json
  end

  it 'retrieves a list of hero names' do
    get '/heroes'

    expect(response).to be_success
    expect(response.body).to eq expected_hero_list
  end
end
