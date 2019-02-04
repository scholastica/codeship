module Codeship
  class Token

    @@last_auth = nil

    # 1. Get an auth token
    # curl -X POST -H "Content-Type: application/json" -H "Accept: application/json" --user 'USERNAME_GOES_HERE:PASSWORD_GOES_HERE' https://api.codeship.com/v2/auth | jq
    # # example response
    # {
    #    "expires_at": 1548859576,
    #    "access_token": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    #    "organizations": [
    #      {
    #        "uuid": "7927cb20-e93e-0133-b53e-76bef8d7b14f",
    #        "name": "info-twilight-hill-75",
    #        "scopes": [
    #          "project.read",
    #          "project.write",
    #          "build.read",
    #          "build.write"
    #        ]
    #      },
    #      {
    #        "uuid": "7fec57e0-e93e-0133-b53e-76bef8d7b14f",
    #        "name": "scholastica",
    #        "scopes": [
    #          "project.read",
    #          "project.write",
    #          "build.read",
    #          "build.write"
    #        ]
    #      }
    #    ]
    #  }

    # curl -XGET -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $TOKEN" https://api.codeship.com/v2/organizations/7fec57e0-e93e-0133-b53e-76bef8d7b14f/projects/b11c9530-d32c-0133-b83f-6af7e052eb76/builds | jq

    def self.get
      if Codeship.config.username.nil? && Codeship.config.password.nil?
        raise ArgumentError, "You need to configure Codeship username and password"
      end

      # We check to see if the @@last_auth is still valid?
      if @@last_auth && Time.at(@@last_auth["expires_at"]) > Time.new
        @@last_auth["access_token"]
      else
        http = Net::HTTP.new "api.codeship.com", 443
        http.use_ssl = true

        req = Net::HTTP::Post.new "/v2/auth"
        req.basic_auth Codeship.config.username, Codeship.config.password

        response = http.request(req)
        if response.code == "200"
          @@last_auth = JSON response.body
          @@last_auth["access_token"]
        else
          # TODO raise an error here
          puts "NO! response: #{response.inspect}"
        end
      end
    end

  end
end
