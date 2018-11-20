describe "retrieving a hero's information" do

  let(:hero_id)   { 1 }
  let(:hero_name) { 'Junkrat' }
  let(:url) do
    "http://localhost:3000/heroes/#{hero_id}"
  end
  let(:hero_spells) do
    [
        "spell_1" => {
            "name" => "blah",
            "type" => "basic",
            "cooldown" => 1-99,
            "description" => "free text string"
        },
        "spell_2" => {
            "name" => "blah",
            "type" => "basic",
            "cooldown" => 0,
            "description" => "free text string"
        },
        "spell_3" => {
            "name" => "blah",
            "type" => "basic",
            "cooldown" => 0,
            "description" => "free text string"
        },
        "spell_4" => {
            "name" => "blah",
            "type" => "basic",
            "cooldown" => 0,
            "description" => "free text string"
        },
        "spell_5" => {
            "name" => "blah",
            "type" => "ultimate",
            "cooldown" => 0,
            "description" => "free text string"
        }
    ]
  end

  it 'successfully retrieves a hero' do
    response = HTTParty.get url

    expect(response).to be_success
    expect(response.content_type).to eq 'application/json'
    expect(response.keys).to contain_exactly 'id', 'name', 'spells'

    expect(response['id']).to eq hero_id
    expect(response['name']).to eq hero_name
    expect(response['spells']).to eq hero_spells
  end
end