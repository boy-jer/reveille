require 'spec_helper'

describe IncidentsController do
  it { should route(:get, '/services/1/incidents').to(action: :index, service_id: '1') }
  it { should route(:get, '/incidents/1').to(action: :show, id: '1') }
  it { should route(:get, '/incidents/1').to(action: :show, id: '1') }
  it { should route(:get, '/services/1/incidents/new').to(action: :new, service_id: '1') }
  it { should route(:post, '/services/1/incidents').to(action: :create, service_id: '1') }
  it { should route(:get, '/incidents/1/edit').to(action: :edit, id: '1') }
  it { should route(:put, '/incidents/1').to(action: :update, id: '1') }
  it { should route(:delete, '/incidents/1').to(action: :destroy, id: '1') }
end
