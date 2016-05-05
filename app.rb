require 'sinatra'
require 'rack/http/signatures'

class SampleHttpSignaturesApp < Sinatra::Base
  use Rack::Http::Signatures::VerifySignature do |config|
    config.public_rsa_sha256_key_from_keyid { |key_id| File.read('fixtures/rsa256/public.pem') if key_id == 'Test' }
    config.public_hmac_sha256_key_from_keyid { |key_id| File.read('fixtures/hs256/key.txt') if key_id == 'Test' }
  end

  get '/' do
    "Hello, world!"
  end
end
