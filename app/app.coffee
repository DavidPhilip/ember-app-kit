`import Resolver from 'resolver'`

App = Ember.Application.extend
  LOG_ACTIVE_GENERATION: true
  LOG_MODULE_RESOLVER: true
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_VIEW_LOOKUPS: true
  modulePrefix: 'appkit' # TODO: loaded via config
  Resolver: Resolver['default']
  
Ember.Application.initializer
  name: 'authentication',
  initialize: (container, application) ->
    Ember.SimpleAuth.Authenticators.OAuth2.reopen
      serverTokenEndpoint: 'http://localhost/agilitybase/public/token'
      makeRequest: (data) ->
        data.grant_type = 'password'
        data.client_id = '1'
        data.client_secret = 'web'
        @._super(data)
      
    Ember.SimpleAuth.setup container, application, {
      authorizerFactory: 'authorizer:oauth2-bearer'
    }
    
`export default App`