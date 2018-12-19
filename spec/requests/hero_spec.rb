require 'rails_helper'

describe "GET /:heroes/:id" do

  before do
    get "/heroes/#{hero.id}"
  end

  context 'with a valid hero id' do
    let(:hero) { create :hero }
    let(:hero_attributes) do
      {
          'attributes' => {
              'name' => hero.name
          }
      }
    end

    # TODO this is kind of ridiculous
    # there must be a cleaner way
    let(:hero_relationships) do
      {
          'relationships' => {
              'spells' => {
                  'data' =>
                      hero.spells.map do |spell|
                        {
                            'id' => spell.id.to_s,
                            'type' => 'spell'
                        }
                      end
              }
          }
      }
    end

    it 'succeeds' do
      expect(response.code).to eq '200'
    end

    describe 'data' do
      let(:hero_data)   { JSON.parse(response.body)['data'] }

      it 'has the correct hero' do
        expect(response.body).to have_json_path 'data'

        expect(hero_data['id']).to eq hero.id.to_s
        expect(hero_data['type']).to eq 'hero'
      end

      it 'has the hero\'s attributes' do
        expect(hero_data).to include hero_attributes
      end

      it 'has the hero\'s relationships' do
        expect(hero_data).to include hero_relationships
      end
    end

    it 'includes spells associated with the hero' do
      expect(response).to be_success
      expect(response.code).to eq '200'

      expect(response.body).to have_json_path 'included'

      included = JSON.parse(response.body)['included']

      expect(included).to_not be_empty
      expect(included.size).to eq 6
      expect(included.map { |s| s['type'] }).to all(eq 'spell')
    end
  end

  context 'with an invalid hero id' do
    xit 'throws a 404' do
      # TODO - Implement client error handling - https://trello.com/c/yML08wkX
      expect(response.status).to eq 404
    end
  end
end
