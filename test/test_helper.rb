ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)
  # Set up all fixtures in test/fixtures/*.yml.
  fixtures :all
  # Add more helper methods to be used by all tests here...

  # Example: Helper method to simulate user login
  def log_in_as(user)
    post login_path, params: { session: { email: user.email,
                                          password: 'password' } }
  end

  # Example: Helper method to create a micropost
  def create_micropost(content)
    Micropost.create(content: content, user: users(:one))
  end
end
