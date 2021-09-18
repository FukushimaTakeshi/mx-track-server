namespace :firebase_certificates do
  task :request do
    FirebaseIdToken::Certificates.request
  end
end
