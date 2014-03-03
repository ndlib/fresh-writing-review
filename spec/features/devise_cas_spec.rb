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

  scenario "Attempts to create a user that already exists" do
    stub_request(:get, "https://cas.library.nd.edu/cas/proxyValidate?service=http://www.example.com/users/service&ticket=faketicket").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => valid_body_xml, :headers => {})
    user = User.new(:username => test_username)
    user.save
    expect(User).to receive(:find_for_authentication).and_return(nil)

    expect{visit "/users/service?ticket=faketicket"}.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
