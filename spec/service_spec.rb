require 'uuid_service'

describe UuidService::Service, '#call' do

  it "retuns json in response to a request" do

    uuid = double("uuid")
    uuid.stub(:value) { '00000000-0000-0000-0000-000000000000' }
    UuidService::Uuid.should_receive(:new) { uuid }

    response = Rack::MockRequest.new(UuidService::Service.new).get('/', 'HTTP_ACCEPT'=>"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")

    expect(response.status).to eq(200)
    expect(response.body).to eq('{"uuid":"00000000-0000-0000-0000-000000000000"}')
    expect(response.original_headers["Content-Type"]).to eq("application/json")

  end

  it "returns a 404 response for non-root requests" do
    response = Rack::MockRequest.new(UuidService::Service.new).get('/invalid', 'HTTP_ACCEPT'=>"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")

    expect(response.status).to eq(404)
    expect(response.body).to eq('{"error":"page not found"}')
    expect(response.original_headers["Content-Type"]).to eq("application/json")

  end

  it "returns a 406 response for non-json requests" do

    response = Rack::MockRequest.new(UuidService::Service.new).get('/', 'HTTP_ACCEPT'=>"text/html;q=0.9")

    expect(response.status).to eq(406)
    expect(response.body).to eq('{"error":"can only return application/json"}')
    expect(response.original_headers["Content-Type"]).to eq("application/json")

  end


end
