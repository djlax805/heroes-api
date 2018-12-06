require 'rails_helper'

describe "GET /:heroes/:id" do

  before do
    get "/heroes/#{hero.id}"
  end

  context 'with a valid hero id' do
   let(:hero) { create :hero }
   let(:hero_schema) { File.read('spec/support/schemas/hero.json') }

    it 'successfully retrieves hero data' do
      expect(response).to be_success
      expect(response.code).to eq '200'

      expect(response.body).to have_json_path 'data'

      data = JSON.parse(response.body)['data']
      expect(data['type']).to eq 'hero'
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