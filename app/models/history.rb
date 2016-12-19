class History < ApplicationRecord
  validates :owner, :request, presence: true

  def self.get_requests_by_owner(owner)
    requests_record = find_by_owner(owner)
    if requests_record then JSON.parse(requests_record.request)['request']['value'] end
  end

  def self.all_requests_hash_array
    all.map { |x| { id: x.id, owner: x.owner, request: x.request } }
  end
end
