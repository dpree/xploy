require 'spec_helper'
require 'xway/api'

describe Xway::Api do
  it { should == ''}
  its('applications')          { should ==     'GET /applications' }
  its('applications.create')   { should ==    'POST /applications' }
  its('applications.find')     { should ==     'GET /applications/:name' }
  its('applications.update')   { should ==     'PUT /applications/:name' }
  its('applications.delete')   { should ==  'DELETE /applications/:name' }
  its('applications.log')      { should ==     'GET /applications/:name/log'}
  its('applications.start')    { should ==    'POST /applications/:name/start'}
  its('applications.stop')     { should ==    'POST /applications/:name/stop'}
  its('applications.restart')  { should ==    'POST /applications/:name/restart'}
  its('applications.redeploy') { should ==    'POST /applications/:name/redeploy'}

  %w[ find    
      update
      delete
      log
      start
      stop
      restart
      redeploy ].each do |method_name|
    specify "#{method_name} accepts :name" do
      subject.send(method_name, 'foo123').should include('/applications/foo123')
    end
  end
end
