require 'uuid_service/uuid'

describe UuidService::Uuid, '#value' do

  it "should return a uuid" do
    uuid = UuidService::Uuid.new
    expect(uuid.value).to match(/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}/)
  end

  it "should return unique uuids on each call" do
    uuids = 100.times.map do |_|
      UuidService::Uuid.new.value
    end
    expect(uuids.uniq!).to be(nil)
  end

end
