require 'sinatra'
require 'braintree'
require 'awesome_print'

  Braintree::Configuration.environment = :sandbox
  Braintree::Configuration.merchant_id = '23nd25g4kn7gnqbb'
  Braintree::Configuration.public_key = '8552x2ym5bvhsycp'
  Braintree::Configuration.private_key = '17f3279171d4fd90ee9cd5256be17abf'

  get '/' do

    # create a test user on braintree
    @result = Braintree::Customer.create(
      first_name: 'Test',
      last_name: 'User',
    )

    # store customer id generated by braintree
    @custid = @result.customer.id

    # Generate a client token for the payment method dropin UI
    @client_token = Braintree::ClientToken.generate
    erb :index

  end

  post '/step2' do

    @custid = params[:custid]

    result = Braintree::PaymentMethod.create(
      customer_id: @custid,
      payment_method_nonce: params[:payment_method_nonce],
    );

    # then stores the token
    @token = result.payment_method.token

    # gets list of plans
    @plans = Braintree::Plan.all

    if result.success?
      @transaction = result.transaction
      erb :step2
    else
      'Process failed'
    end

  end

  post '/step3' do

    @custid = params[:custid]
    @token = params[:token]
    @plan = params[:plan]

    result = Braintree::Subscription.create(
      plan_id: @plan,
      payment_method_token: @token
    )

    if result.success?
      @transaction = result.subscription.id
      erb :step3
    else
      'Process failed'
    end

  end