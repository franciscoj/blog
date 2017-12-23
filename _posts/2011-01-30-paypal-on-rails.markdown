---
title: PayPal on Rails
date: 2011-01-30 00:00
categories: ruby
---

After many searches in Google I found many explanations on how to use PayPal,
however any of them did what I exactly needed. So here's what I did step by
step last time I needed it.

## How PayPal works

Take a look at this flow diagram:

{% responsive_img PayPalWPS.jpg %}

 1.   The buyer goes to PayPal and performs the needed payment. (This is steps
      1 and 2 in the diagram)
 2.   PayPal takes the payment and redirects your buyer back to your
      application.  (steps 3 and 4)
 3.   Some time after that, PayPal will send you a callback response with the
    details of the received payment. Your application will use those details to
make sure the payment was OK and mark the order as paid. (Steps 5 and 6)

## Set up your PayPal sandbox
 * [Sign up here](https://developer.paypal.com) To get a sandbox
     account. This account will allow you to handle your development
     tools:

  * _Seller and buyer mock accounts_: That way you can test your payments
    without need to use a real account/bank account/credit card.
  * _IPN (Instant Payment Notification) testing_: This is the way that
    PayPal informs your application when the payment is done.

 * Create a seller and buyer mock accounts. Preconfigured seller
 accounts failed for me, they always failed for me 100% of times in a
 period of many months. I'm quite sure it's my fault, but I just
 couldn't find enough info to know what I did wrong.

## Set up your application

### Install ActiveMerchant.
Here it came my second big problem. Just couldn't figure out how to make it
work in the form of a gem. So I finally had to install it as a plugin.
`rails plugin install git://github.com/Shopify/active_merchant.git`

From the above diagram you application will need to:

* Be able to send payment details to PayPal.
* Receive a callback from PayPal to acknowledge the received payment.

And here's where ActiveMerchant enters. It provides a helper to craft a form
with the needed hidden fields which you will send to PayPal and a class with
the needed logic to receive and validate the callback from PayPal.

### Configure Active Merchant

Set up an initializer file like `config/initializers/active_merchant.rb` with
the following content (it explains itself... isn't it?):

{% gist 792543 active_merchant.rb %}

### Set up the PayPal button

Use something like that to generate the button that your user has to push so
that he makes the payment.

{% gist 792543 new.html.erb %}

If you need to send more info to PayPal take a look at the ActiveMerchant's doc
or even at its code, to see which options are accepted by the
`payment_service_for` helper. Just FYI, the helper doesn't support multiple
items. In case you need it you'll need to craft your own helper... and maybe
send a pull request to ActiveMerchant ^^.

### Gather and acknowledge the PayPal response

PayPal will send you a notification so you can know when the order is paid.
This following code is a sample of how this can be done.

{% gist 792543 notifications_controller.rb %}

## That's all folks!

This is the most simple way I found to make PayPal work with ActiveMerchant.
However it's very limited and lacks support for things like multiple items and
data encryption between your app and PayPal. Unluckly ActiveMerchant lacks
support for these two things on its PayPal integration. However you can achieve
this by using something [like that](http://www.fortytwo.gr/blog/14/Using-Paypal-with-Rails).

If you find some stupid thing or some bug here, just let me know so that I can
fix it :)
