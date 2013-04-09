Reveille.Router.map ->
  @route 'dashboard'
  @resource 'services', path: '/services', ->
    @resource 'service', path: ':service_id', ->
      @route 'edit' #, path: '/edit'
    @route 'new' #, path: '/new'

Reveille.Router.reopen
  location: 'history'
  rootUrl: '/'
