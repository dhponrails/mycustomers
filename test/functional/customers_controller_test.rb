require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  def setup
    @request.session[:user_id] = users(:quentin).id

  end 

  
  test "should get index" do
    get :index, :mailing_list_id => 1
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new, :mailing_list_id => 1
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, :customer => {:email => "test@email.com" }, :mailing_list_id => 1
    end

    assert_redirected_to mailing_list_customers_path
  end

  test "should show customer" do
    get :show, :id => customers(:one).to_param, :mailing_list_id => 1
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => customers(:one).to_param, :mailing_list_id => 1
    assert_response :success
  end

  test "should update customer" do
    put :update, :id => customers(:one).to_param, :customer => { :email => "test2@gmail.com"}, :mailing_list_id => 1
  assert_redirected_to mailing_list_customers_path
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, :id => customers(:one).to_param, :mailing_list_id => 1
    end

mailing_list_customers_url
  end
end  
