namespace :firebase_certificates do
  task request: :environment do
    FirebaseIdToken::Certificates.request
  end
end
