Reveille.Adapter = DS.RESTAdapter.extend
  namespace: 'api'
  bulkCommit: false

Reveille.Store = DS.Store.extend
  revision: 12
  adapter: Reveille.Adapter.create()