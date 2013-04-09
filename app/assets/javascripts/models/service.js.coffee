Reveille.Service = DS.Model.extend
  name: DS.attr('string')
  autoResolveTimeout: DS.attr('number')
  acknowledgeTimeout: DS.attr('number')
  state: DS.attr('string')
  apiKey: DS.attr('string')