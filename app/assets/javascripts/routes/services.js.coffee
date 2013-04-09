Reveille.ServicesRoute = Ember.Route.extend
  model: ->
    Reveille.Service.find()
