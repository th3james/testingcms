require 'test_helper'

class LoginTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  def test_should_not_save_without_username
    user = Login.new(:password => 'wcmc')
    assert !user.save, 'Saved user without username'
  end

  def test_should_not_save_without_password
    user = Login.new(:username => 'wcmc')
    assert !user.save, 'Saved user without password'
  end
end
