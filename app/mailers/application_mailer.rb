class ApplicationMailer < ActionMailer::Base
# default from options, layouts point to "partials" that are in the layout directory, confusing! 
default from: 'no-reply@jungle.com'
layout 'mailer'
end

