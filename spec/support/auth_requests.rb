[:get, :patch, :put, :post, :delete].each do |method|

  define_method "auth_#{method}" do |path, *args|
    user =  User.find_or_initialize_by(
              email: 'sample@email.com',
            )

    user.password = 'password'
    user.save

    request_details = {
                        browser: 'chrome', 
                        device: 'desktop', 
                        device_id: '0'
                      }

    auth_token = user.set_access_token request_details

    params = args[0]
    headers = args[1] || {}
    headers.merge!(
        AccessToken: auth_token.token
      )

    send(method, path, params: params, headers: headers)
  end

end
