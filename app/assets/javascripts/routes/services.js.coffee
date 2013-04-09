Reveille.ServicesRoute = Ember.Route.extend
  model: ->
    Reveille.Service.find()
  setupController: (controller, model) ->
    controller.set('services', model)
    @controllerFor('application').set('currentRoute', 'services')

Reveille.ServicesShowRoute = Ember.Route.extend
  model: (params) ->
    Reveille.Service.find(params.service_id)
  setupController: (controller, model) -> 
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'services')