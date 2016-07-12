module IntegrationSpecHelper
  def login_with_oauth(service = :twitter)
    visit "/auth/#{service}"
  end

  def stub_omni_auth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      extra: {
        raw_info: {
          uid: "1234",
          name: "Test",
          screen_name: "test",
        }
      },
      credentials: {
        token: "token",
        secret: "secret_token"
      }
    })
  end
end
