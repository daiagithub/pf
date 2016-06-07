class OauthUrlMappings {

    static mappings = {

        "/oauth/$provider/callback"(controller: 'oauth', action: 'callback')
        "/oauth/$provider/authenticate"(controller: 'oauth', action: 'authenticate')
    }
}
