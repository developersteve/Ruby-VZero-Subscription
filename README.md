# Subscriptions Ruby demo using Sinatra 

This is a really basic example of the Braintree Subscriptions in Sinatra to create a customer, attach a payment method and then create a subscription.

## Technology

This demo uses

* Ruby 1.9.3 or higher
* The [Sinatra](http://www.sinatrarb.com/) web framework

## Demo
* Log into sandbox.braintreepayments.com and add one or more subscription plans 
* Fill in the following credentials:
  * Number: `4111 1111 1111 1111`
  * CVV: `123`
  * Expiration date: `11/2020`
* Click submit

or you can sign in using your PayPal Sandbox account

## Running the demo locally

* Run `bundle` to install all dependencies
* Run `ruby app.rb` to start the app
* Visit `http://localhost:4567/` in your browser
* Proceed as above
