require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Heroes' do
  header "Content-Type", "application/json"

  get 'heroes/:id' do
    context '200' do
      let(:id) { 1 }
      example 'Get a hero' do

        do_request
      end
    end
  end
end