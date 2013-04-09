Reveille.Store = DS.Store.extend
  revision: 12
  adapter: DS.RESTAdapter.create
    namespace: 'api'
    bulkCommit: false