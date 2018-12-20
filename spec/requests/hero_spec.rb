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

    let(:parsed_body) { JSON.parse response.body }

    it 'succeeds' do
      expect(response.code).to eq '200'
    end

    describe 'data' do
      let(:hero_data)   { parsed_body.fetch 'data' }

      it 'has the correct hero' do
        expect(response.body).to have_json_path 'data'

        expect(hero_data['id']).to eq hero.id.to_s
        expect(hero_data['type']).to eq 'hero'
      end

      it 'has the hero\'s name' do
        expect(hero_data).to include hero_attributes
      end

      it 'has the hero\'s relationships' do
        expect(hero_data).to include hero_relationships
      end
    end

    describe 'includes' do
      let(:included_data) { parsed_body.fetch 'included' }

      it 'has spells associated with the hero' do
        expect(response.body).to have_json_path 'included'

        expect(included_data).to_not be_empty
        expect(included_data.size).to eq hero.spells.size
        expect(included_data.map { |s| s['type'] }).to all(eq 'spell')
      end
    end
  end

  context 'with an invalid hero id' do
    xit 'throws a 404' do
      # TODO - Implement client error handling - https://trello.com/c/yML08wkX
      expect(response.status).to eq 404
    end
  end
end
