# Reveille.ServicesRoute = Ember.Route.extend
  # model: ->
    # Reveille.Service.find()
  # setupController: (controller, model) ->
    # controller.set('services', model)
    # @controllerFor('application').set('currentRoute', 'services')


Reveille.DashboardRoute = Ember.Route.extend
  setupController: (controller) ->
    @controllerFor('application').set('currentRoute', 'dashboard')