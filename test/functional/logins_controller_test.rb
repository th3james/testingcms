require 'test_helper'

class LoginsControllerTest < ActionController::TestCase

  def test_should_post_new_user
    post(:create, {:login => {"username" => 'PostTest', "password" => 'superpassword'}})
    assert_redirected_to(:action => 'index')
  end

  def test_login_as_valid_user
    post(:do_login, {:user => {"username"=>"James", "password"=>"wcmc"}})
    assert_redirected_to sections_path
  end

  def test_incorrect_login_rejected
    post(:do_login, {:user => {"username"=>"Fake", "password"=>"user"}})
    assert_redirected_to '/login'
  end

  def test_logout_after_login
    post(:do_login, {:user => {"username"=>"James", "password"=>"wcmc"}})
    assert_redirected_to sections_path

    post 'logout'
    assert_equal nil, session[:post_id]
  end
  
end
