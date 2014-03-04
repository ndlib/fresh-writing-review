require "spec_helper"

feature "Devise CAS ticket" do
  let(:test_username) { "testuser" }
  let(:valid_body_xml) {
    "<cas:serviceResponse xmlns:cas='http://www.yale.edu/tp/cas'>
        <cas:authenticationSuccess>
          <cas:user>#{test_username}</cas:user>
        </cas:authenticationSuccess>
      </cas:serviceResponse>"
  }

  before do
    stub_request(:get, "https://cas.library.nd.edu/cas/proxyValidate?service=http://www.example.com/users/service&ticket=faketicket").
                 with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
                 to_return(:status => 200, :body => valid_body_xml, :headers => {})
  end

  scenario "Successfully creates a user record from a new CAS ticket" do
    expect{visit "/users/service?ticket=faketicket"}.to change{User.count}.by(1)
    expect(page.status_code).to be == 200
  end

  scenario "Calls attempts to find a user a second time if it fails to create a record of that user" do
    user = User.create(:username => test_username)
    expect(User).to receive(:find_for_authentication).exactly(2).times.and_return(nil, user)

    visit "/users/service?ticket=faketicket"
    expect(page.status_code).to be == 200
  end

  scenario "Raises an error if it can't find an existing user twice" do
    user = User.create(:username => test_username)
    expect(User).to receive(:find_for_authentication).exactly(2).times.and_return(nil, nil)

    expect{visit "/users/service?ticket=faketicket"}.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
