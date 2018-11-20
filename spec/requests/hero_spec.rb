require 'rails_helper'

describe "GET /:heroes/:id" do

  before do
    get "/heroes/#{hero_id}"
  end

  context 'with a valid hero id' do
    let(:hero_id)   { '1' }
    let(:hero_name) { 'Junkrat' }
    let(:hero_json) do
      {
          "name" => hero_name,
          "id" => hero_id,
          "spells" => [
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
      }.to_json
    end

    it 'successfully retrieves a JSON hero object' do
      expect(response).to be_success
      expect(response.body).to be_json_eql(hero_json)
    end
  end

  context 'with an invalid hero id' do
    junklet :hero_id

    it 'throws a 404' do
      # TODO - Implement client error handling - https://trello.com/c/yML08wkX
      expect(response.status).to eq 404
    end
  end
end