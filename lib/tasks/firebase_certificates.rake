namespace :firebase_certificates do
  task :request do
    p 'start firebase_certificates'
    certificate = FirebaseIdToken::Certificates.request
    p certificate
    p 'end firebase_certificates'
  end
end
