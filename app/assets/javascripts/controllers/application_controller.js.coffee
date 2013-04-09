Reveille.ApplicationController = Ember.Controller.extend
  isHome: (->
    @get('currentRoute') == 'dashboard'
  ).property('currentRoute')

  isServices: (->
    @get('currentRoute') == 'services'
  ).property('currentRoute')