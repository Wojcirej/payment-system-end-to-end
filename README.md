# Payment system - end to end tests
This is separate codebase containing end to end tests for payment system. See repos for the [backend](https://github.com/Wojcirej/payment-system) and for the [frontend](https://github.com/Wojcirej/payment-system-frontend) for more details.

Tests are using staging environment, including staging's remote database.

# Technological stack
* Ruby
* RSpec
* Capybara
* Cuprite webdriver
* ActiveRecord to map database tables for classes
* FactoryBot for preparing test data

# Environment setup
You'll need two YAML files placed in `config/` directory:
* `database.yml` containing information making connection with remote database possible:
 * `adapter`
 * `encoding`
 * `url`
 * `pool`
* `application.yml` containing necessary info for connection with remote application like:
 * `REMOTE_PROTOCOL`
 * `REMOTE_DOMAIN`
 * `REMOTE_BACKEND_URL`

For both files there are prepared examples you just need to fill.

# But why?
* It's going to be easier organize code
* I don't actually need heavy cavalry provided by Rails for this
* Speed up development test suite
* Speed up end to end test suite

# Run tests
`rspec`

# Potential TODOs
* Find better way to share models logic between actual backend app and this app. Currently I'm repeating myself, and it might lead to incosistencies. But at least I can quickly set up test data if necessary. Perhaps some gems?
* Investigate if I actually need `ActiveRecord` here and models sharing...
