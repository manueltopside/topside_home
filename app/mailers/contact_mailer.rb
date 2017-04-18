class ContactMailer < ActionMailer::Base #klasse ContactMailer die auch alles der Klasse ActionMailer enthaelt die schon vorinstalliert war
  default to: 'derdort@web.de'
  
  def contact_email(name, email, body)  #funktionen in ruby immer mit def funkticon name = contact_email
    @name = name
    @email = email
    @body = body
    
    mail(from: email, subject: 'Contact Form Message')
  end
end