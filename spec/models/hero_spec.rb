# shared_examples_for "a listable hero resource" do
#   it 'successfully retrieves a hero' do
#     hero = FactoryGirl.create :hero
#
#     get "/heroes#{hero.id}"
#     expect(response).to be_success
#   end
# end